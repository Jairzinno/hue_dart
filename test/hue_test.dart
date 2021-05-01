import 'dart:async' hide Timer;
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:hue_dart/src/group/group_action.dart';
import 'package:hue_dart/src/light/light_state.dart';
import 'package:hue_dart/src/rule/condition.dart';
import 'package:hue_dart/src/rule/rule_action.dart';
import 'package:hue_dart/src/schedule/command.dart';
import 'package:hue_dart/src/schedule/schedule_type.dart';
import 'package:hue_dart/src/sensor/sensor_config.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  Bridge sut;
  MockClient client;

  setUp(() {
    client = MockClient();
    sut = Bridge(client, '127.0.0.1', 'username');
  });

  mockGet(String responseBody, [String url]) {
    when(client.get(Uri.parse(url ?? any)))
        .thenAnswer((_) => Future.value(Response(responseBody, 200)));
  }

  mockDelete(String responseBody) {
    when(client.delete(any))
        .thenAnswer((_) => Future.value(Response(responseBody, 200)));
  }

  mockPost(String responseBody) {
    when(client.post(any))
        .thenAnswer((_) => Future.value(Response(responseBody, 200)));
    when(client.post(any, body: anyNamed('body')))
        .thenAnswer((_) => Future.value(Response(responseBody, 200)));
  }

  mockPut(String responseBody) {
    when(client.put(any, body: anyNamed('body')))
        .thenAnswer((_) => Future.value(Response(responseBody, 200)));
  }

  expectDate(DateTime date, int year, int month, int day, int hour, int minute,
      int second) {
    expect(date.year, year);
    expect(date.month, month);
    expect(date.day, day);
    expect(date.hour, hour);
    expect(date.minute, minute);
    expect(date.second, second);
  }

  group('hue tests', () {
    group('discovery bridges', () {
      test('automatic discovery returns single result', () async {
        BridgeDiscovery bridgeDiscovery = BridgeDiscovery(client);
        mockGet(
            '[{"id":"001788fffe256501","internalipaddress":"192.168.2.1"}]');
        final discoveryResult = await bridgeDiscovery.automatic();
        expect(discoveryResult, isNotNull);
        expect(discoveryResult.length, 1);
        expect(discoveryResult.first.ipAddress, '192.168.2.1');
        expect(discoveryResult.first.id, '001788fffe256501');
      });

      test('automatic discovery returns no result', () async {
        BridgeDiscovery bridgeDiscovery = BridgeDiscovery(client);
        mockGet('[]');
        final discoveryResult = await bridgeDiscovery.automatic();
        expect(discoveryResult, isNotNull);
        expect(discoveryResult.length, 0);
      });

      test('empty response for automatic discovery throws exception', () async {
        BridgeDiscovery bridgeDiscovery = BridgeDiscovery(client);
        mockGet('');
        try {
          await bridgeDiscovery.automatic();
        } catch (e) {
          expect(e, isNotNull);
        }
      });
    });

    group('configuration api', () {
      test('create user', () async {
        mockPost(
            '[{"success":{"username":"19156256a1cc24112436792453e8ae7"}}]');
        final response = await sut.createUser('deviceType');
        expect(response.username, '19156256a1cc24112436792453e8ae7');
        expect(response.name, 'deviceType');
        final body = {'devicetype': 'deviceType'};
        verify(client.post(Uri.parse('http://127.0.0.1/api/'),
            body: json.encode(body)));
      });

      test('delete user', () async {
        mockDelete('[{"success":"/config/whitelist/1234567890 deleted"}]');
        final response = await sut.deleteUser('1234567890');
        verify(client.delete(Uri.parse(
            'http://127.0.0.1/api/username/config/whitelist/1234567890')));
        expect(response.success.length, 1);
      });

      test('update configuration', () async {
        mockPut(
            '[{"success":{"/config/ipaddress":"192.168.1.3"}}, {"success":{"/config/netmask":"255.255.255.0"}}, {"success":{"/config/dhcp": false}}]');
        final configuration = Configuration((b) => b
          ..ipAddress = '192.168.1.3'
          ..netMask = '255.255.255.0'
          ..dhcp = false);
        final response = await sut.updateConfiguration(configuration);
        expect(response.success.length, 3);
        final body = {
          'ipaddress': '192.168.1.3',
          'netmask': '255.255.255.0',
          'dhcp': false
        };
        verify(client.put(Uri.parse('http://127.0.0.1/api/username/config'),
            body: json.encode(body)));
      });

      test('get full state', () async {
        mockGet(fullState);
        final fullConfig = await sut.completeConfiguration();
        verify(client.get(Uri.parse('http://127.0.0.1/api/username')));
        expect(fullConfig.groups.length, 3);
        expect(fullConfig.groups.keys.first, 1.toString());
        expect(fullConfig.groups.values.first.name, 'Room 2');
        expect(fullConfig.lights.length, 3);
        expect(fullConfig.lights.keys.first, 1.toString());
        expect(fullConfig.lights.values.first.state.on, false);
        expect(fullConfig.lights.values.first.state.brightness, 56);
        expect(fullConfig.resourceLinks.length, 3);
        expect(fullConfig.resourceLinks.keys.first, '9910');
        expect(fullConfig.resourceLinks.values.first.name, 'Tap toggle (2)');
        expect(fullConfig.resourceLinks.values.first.classId, 2);
        expect(fullConfig.rules.length, 3);
        expect(fullConfig.rules.keys.first, 1.toString());
        expect(fullConfig.rules.values.first.name, '1:huelabs/tap-toggle');
        expect(fullConfig.rules.values.first.conditions.first.address,
            '/sensors/2/state/buttonevent');
        expect(fullConfig.scenes.length, 3);
        expect(fullConfig.scenes.keys.first, '497b50d84-on-0');
        expect(fullConfig.scenes.values.first.name, 'Sunset on 0');
        expect(fullConfig.scenes.values.first.lightIds.length, 3);
        expect(fullConfig.schedules.length, 3);
        expect(fullConfig.schedules.keys.first, '4180398747470589');
        expect(fullConfig.schedules.values.first.name, 'Running');
        expect(fullConfig.schedules.values.first.command.address,
            '/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action');
        expect(fullConfig.sensors.length, 3);
        expect(fullConfig.sensors.keys.first, 1.toString());
        expect(fullConfig.sensors.values.first.name, 'Daylight');
        expect(fullConfig.sensors.values.first.config.on, true);
      });

      test('get config', () async {
        mockGet(config);
        final configuration = await sut.configuration();
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/config')));
        expect(configuration.name, 'Philips hue');
        expect(configuration.zigbeeChannel, 11);
        expect(configuration.bridgeId, '001788FFFE256501');
        expect(configuration.mac, '22:24:88:52:56:01');
        expect(configuration.dhcp, true);
        expect(configuration.ipAddress, '192.168.2.100');
        expect(configuration.netMask, '255.255.255.0');
        expect(configuration.gateway, '192.168.2.240');
        expect(configuration.proxyAddress, 'none');
        expect(configuration.proxyPort, 0);
        expect(configuration.utc, '2018-07-13T08:55:22');
        expectDate(configuration.utcDate, 2018, 7, 13, 8, 55, 22);
        expect(configuration.localTime, '2018-07-13T10:55:22');
        expectDate(configuration.localTimeDate, 2018, 7, 13, 10, 55, 22);
        expect(configuration.timeZone, 'Europe/Amsterdam');
        expect(configuration.modelId, 'BSB002');
        expect(configuration.dataStoreVersion, '71');
        expect(configuration.swVersion, '1806051111');
        expect(configuration.apiVersion, '1.26.0');
        expect(configuration.softwareUpdate.checkForUpdate, false);
        expect(configuration.softwareUpdate.lastChange, '2018-06-29T21:53:49');
        expect(configuration.softwareUpdate.bridge.state, 'noupdates');
        expect(configuration.softwareUpdate.bridge.lastInstall,
            '2018-06-29T21:49:53');
        expectDate(configuration.softwareUpdate.bridge.lastInstallDate, 2018, 6,
            29, 21, 49, 53);
        expect(configuration.softwareUpdate.state, 'noupdates');
        expect(
            configuration.softwareUpdate.autoInstall.updateTime, 'T23:00:00');
        expectDate(configuration.softwareUpdate.autoInstall.updateDate, 1970, 1,
            1, 23, 0, 0);
        expect(configuration.softwareUpdate.autoInstall.on, true);
        expect(configuration.linkButton, false);
        expect(configuration.portalServices, true);
        expect(configuration.portalConnection, 'connected');
        expect(configuration.portalState.signedOn, true);
        expect(configuration.portalState.incoming, false);
        expect(configuration.portalState.outgoing, true);
        expect(configuration.portalState.communication, 'disconnected');
        expect(configuration.internetServices.internet, 'connected');
        expect(configuration.internetServices.remoteAccess, 'connected');
        expect(configuration.internetServices.time, 'connected');
        expect(configuration.internetServices.swUpdate, 'connected');
        expect(configuration.factoryNew, false);
        expect(configuration.replacesBridgeId, null);
        expect(configuration.starterKitId, '');
        expect(configuration.whitelist.length, 3);
        expect(configuration.whitelist.keys.first,
            '688a789c0bd6442e48969b1d945920');
        expect(configuration.whitelist.values.first.lastUsedDate,
            '2016-07-10T19:47:00');
        expectDate(configuration.whitelist.values.first.lastUsed, 2016, 7, 10,
            19, 47, 00);
        expect(configuration.whitelist.values.first.createDate,
            '2016-07-10T19:47:00');
        expectDate(configuration.whitelist.values.first.created, 2016, 7, 10,
            19, 47, 00);
        expect(configuration.whitelist.values.first.name, 'my_hue_app#test');
      });
    });

    group('group api', () {
      test('all groups', () async {
        mockGet(allGroups);
        final response = await sut.groups();
        expect(response.length, 3);
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/groups')));
      });

      test('single group', () async {
        mockGet(singleGroup);
        final group = await sut.group(1);
        expect(group.name, 'Room 2');
        expect(group.state.allOn, false);
        expect(group.state.anyOn, false);
        expect(group.groupLights[0].id, 17);
        expect(group.groupLights[1].id, 15);
        expect(group.type, 'Room');
        expect(group.recycle, false);
        expect(group.className, 'Living room');
        expect(group.action.on, false);
        expect(group.action.brightness, 144);
        expect(group.action.hue, 7688);
        expect(group.action.saturation, 199);
        expect(group.action.effect, 'none');
        expect(group.action.xy, [0.5014, 0.4153]);
        expect(group.action.ct, 447);
        expect(group.action.effect, 'none');
        expect(group.action.colorMode, 'ct');
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/groups/1')));
      });

      test('create group', () async {
        mockPost('[{"success":{"id":"1"}}]');
        final group = Group((b) => b
          ..name = 'Room 2'
          ..className = 'Other'
          ..type = 'Room'
          ..lightIds = ListBuilder(['1', '2']));
        final response = await sut.createGroup(group);
        expect(response.id, 1);
        final body = {
          'name': 'Room 2',
          'class': 'Other',
          'type': 'Room',
          'lights': ["1", "2"]
        };
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/groups'),
            body: json.encode(body)));
      });

      test('update group attributes', () async {
        mockPut(
            '[{"success":{"/groups/1/lights":["1"]}},{"success":{"/groups/1/name":"Kitchen"}}]');
        final group = Group((b) => b
          ..id = 1
          ..name = 'Room 2'
          ..lightIds = ListBuilder(['1'])
          ..className = 'Kitchen');

        final response = await sut.updateGroupAttributes(group);
        expect(response.success.length, 2);
        final body = {
          'name': 'Room 2',
          'class': 'Kitchen',
          'lights': ['1']
        };
        verify(client.put(Uri.parse('http://127.0.0.1/api/username/groups/1'),
            body: json.encode(body)));
      });

      test('update group state', () async {
        mockPut(
            '[{"success":{ "address": "/groups/1/action/on", "value": true}},{"success":{ "address": "/groups/1/action/effect", "value":"colorloop"}},{"success":{ "address": "/groups/1/action/hue", "value":6000}}]');
        final group = Group(
          (b) => b
            ..id = 1
            ..name = 'Room 2'
            ..lightIds = ListBuilder(['1'])
            ..action.replace(
              GroupAction((b) => b
                ..on = true
                ..hue = 2000
                ..effect = 'colorloop'),
            ),
        );

        final response = await sut.updateGroupState(group);
        expect(response.success.length, 3);
        final body = {'on': true, 'hue': 2000, 'effect': 'colorloop'};
        verify(client.put(
            Uri.parse('http://127.0.0.1/api/username/groups/1/action'),
            body: json.encode(body)));
      });

      test('delete group', () async {
        mockDelete('[{"success":"/groups/1 deleted"}]');
        final group = Group(
          (b) => b
            ..id = 1
            ..name = 'Room 2'
            ..lightIds = ListBuilder(
              ['1'],
            ),
        );

        final response = await sut.deleteGroup(group);
        verify(
            client.delete(Uri.parse('http://127.0.0.1/api/username/groups/1')));
        expect(response.success.length, 1);
      });
    });

    group('light api', () {
      test('calling lights() returns list of lights', () async {
        mockGet(allLights);
        final lights = await sut.lights();
        expect(lights, isNotNull);
        expect(lights.length, 4);
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/lights')));
      });

      test('calling light() returns a single light', () async {
        mockGet(singleLight);
        final light = await sut.light(1);
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/lights/1')));
        expect(light, isNotNull);
        expect(light.state.on, false);
        expect(light.state.brightness, 244);
        expect(light.state.hue, 14988);
        expect(light.state.saturation, 141);
        expect(light.state.effect, 'none');
        expect(light.state.xy, [0.4575, 0.4101]);
        expect(light.state.ct, 366);
        expect(light.state.alert, 'none');
        expect(light.state.colorMode, 'ct');
        expect(light.state.mode, 'homeautomation');
        expect(light.state.reachable, true);
        expect(light.type, 'Extended color light');
        expect(light.name, 'Room 2');
        expect(light.modelId, 'LCT007');
        expect(light.manufacturerName, 'Philips');
        expect(light.productName, 'Hue bulb A19');
      });

      test('test light model ids', () async {
        testModelId(
            String modelId, String runtimeType, String productName) async {
          mockGet(singleLightModelIdPlaceholder.replaceFirst(
              '<model_id>', modelId));
          final light = await sut.light(1);
          expect(light.model.modelId, modelId);
          expect(light.model.runtimeType.toString(), runtimeType);
          expect(light.model.productName, productName);
        }

        List<Map<String, String>> models = [
          {
            'id': 'LTP001',
            'runtimeType': 'Ambiance',
            'productName': 'Ambiance Pendant'
          },
          {
            'id': 'LLC014',
            'runtimeType': 'Aura',
            'productName': 'Living Colors Gen3 Aura'
          },
          {
            'id': 'HBL001',
            'runtimeType': 'Beyond',
            'productName': 'Hue Beyond Table'
          },
          {
            'id': 'LLC005',
            'runtimeType': 'Bloom',
            'productName': 'Hue Living Colors Bloom'
          },
          {
            'id': 'LCT001',
            'runtimeType': 'Bulb',
            'productName': 'Hue bulb A19'
          },
          {
            'id': 'LCT011',
            'runtimeType': 'DownLight',
            'productName': 'Hue BR30'
          },
          {
            'id': 'HEL001',
            'runtimeType': 'Entity',
            'productName': 'Hue Entity Table'
          },
          {'id': 'LLC020', 'runtimeType': 'Go', 'productName': 'Hue Go'},
          {
            'id': 'HIL001',
            'runtimeType': 'Impulse',
            'productName': 'Hue Impulse Table'
          },
          {
            'id': 'LLC010',
            'runtimeType': 'Iris',
            'productName': 'Hue Living Colors Iris'
          },
          {
            'id': 'LST001',
            'runtimeType': 'LightStrip',
            'productName': 'Hue LightStrip'
          },
          {
            'id': 'HML001',
            'runtimeType': 'Phoenix',
            'productName': 'Hue Phoenix Centerpiece'
          },
          {
            'id': 'LCT003',
            'runtimeType': 'Spot',
            'productName': 'Hue Spot GU10'
          },
          {
            'id': 'LLC013',
            'runtimeType': 'StoryLight',
            'productName': 'Disney Living Colors'
          },
          {'id': 'LDF002', 'runtimeType': 'White', 'productName': 'White'}
        ];
        for (Map<String, String> model in models) {
          testModelId(model['id'], model['runtimeType'], model['productName']);
        }
      });

      test('calling attributes() expects a map with state', () async {
        mockPut(
            '[{"success":{"/lights/1/state/xy":[0.168,0.041]}},{"success":{"/lights/1/state/ct":0}},{"success":{"/lights/1/state/alert":"none"}},{"success":{"/lights/1/state/sat":254}},{"success":{"/lights/1/state/effect":"none"}},{"success":{"/lights/1/state/bri":10}},{"success":{"/lights/1/state/hue":4444}},{"error":{"address":"/lights/1/state/colormode","description":"parameter, colormode, not available","type":6}},{"success":{"/lights/1/state/on":true}}]');
        final light = Light((b) => b
          ..id = 1
          ..state.replace(LightState((b) => b
            ..on = true
            ..xy = ListBuilder([0.168, 0.041])
            ..ct = 0
            ..brightness = 10
            ..alert = 'none'
            ..effect = 'none'
            ..saturation = 254
            ..hue = 4444
            ..colorMode = 'ct')));
        final result = await sut.updateLightState(light);
        expect(result.success.length, 8);
        expect(result.errors.length, 1);
        final body = {
          'on': true,
          'bri': 10,
          'hue': 4444,
          'sat': 254,
          'xy': [0.168, 0.041],
          'ct': 0,
          'alert': 'none',
          'effect': 'none',
          'colormode': 'ct'
        };
        verify(client.put(
            Uri.parse('http://127.0.0.1/api/username/lights/1/state'),
            body: json.encode(body)));
      });

      test('calling state() expects a map with name', () async {
        mockPut('[{"success":{"/lights/1/name":"test name"}}]');
        final light = Light((b) => b
          ..id = 1
          ..name = 'test name');
        final result = await sut.renameLight(light);
        expect(result.success.length, 1);
        expect(result.errors.length, 0);
        final body = {'name': 'test name'};
        verify(client.put(Uri.parse('http://127.0.0.1/api/username/lights/1'),
            body: json.encode(body)));
      });

      test('change color of light with color mode ct', () async {
        mockGet(
            singleLightColorModePlaceHolder.replaceFirst('<color_mode>', 'ct'));
        var light = await sut.light(1);
        expect(light.state.colorMode, 'ct');
        light = light.changeColor(
            red: 0.8796791443850267,
            green: 0.8398430992614165,
            blue: 0.711241233501953);
        expect(light.state.ct, 230);
      });

      test('change color of light with color mode hs', () async {
        mockGet(
            singleLightColorModePlaceHolder.replaceFirst('<color_mode>', 'hs'));
        var light = await sut.light(1);
        expect(light.state.colorMode, 'hs');
        light = light.changeColor(
            red: 0.8796791443850267,
            green: 0.8398430992614165,
            blue: 0.711241233501953);
        expect(light.state.hue, 8339);
        expect(light.state.saturation, 49);
        expect(light.state.brightness, 224);
      });

      test('change color of light with color mode xy', () async {
        mockGet(
            singleLightColorModePlaceHolder.replaceFirst('<color_mode>', 'xy'));
        var light = await sut.light(1);
        expect(light.state.colorMode, 'xy');
        light = light.changeColor(red: 1.0, blue: 1.0, green: 1.0);
        expect(light.state.xy, [0.32272672086556803, 0.32902290955907926]);
      });

      test('convert color of light to rgb with color mode ct', () async {
        mockGet(
            singleLightColorModePlaceHolder.replaceFirst('<color_mode>', 'ct'));
        final light = await sut.light(1);
        expect(light.state.colorMode, 'ct');
        final colors = light.colors;

        expect(colors.temperature, 2732);
        expect(colors.ct, 366);
        expect(colors.red, 0.7931550802139037);
        expect(colors.green, 0.6583998112346192);
        expect(colors.blue, 0.35289665824727007);
        expect(colors.hue, 7579);
        expect(colors.saturation, 142);
        expect(colors.brightness, 202);
        expect(colors.xy[0], 0.4550246766722201);
        expect(colors.xy[1], 0.4201045778933856);
      });

      test('convert color of light to rgb with color mode hs', () async {
        mockGet(
            singleLightColorModePlaceHolder.replaceFirst('<color_mode>', 'hs'));
        final light = await sut.light(1);
        expect(light.state.colorMode, 'hs');
        final colors = light.colors;

        expect(colors.hue, 48420);
        expect(colors.saturation, 254);
        expect(colors.brightness, 250);
        expect(colors.red, 0.42673957909563304);
        expect(colors.green, 0.003844675124951928);
        expect(colors.blue, 0.9803921568627451);
        expect(colors.temperature, 6500);
        expect(colors.ct, 154);
        expect(colors.xy[0], 0.19892897773136312);
        expect(colors.xy[1], 0.06913836242163192);
      });

      test('convert color of light to rgb with color mode xy', () async {
        mockGet(
            singleLightColorModePlaceHolder.replaceFirst('<color_mode>', 'xy'));
        final light = await sut.light(1);
        expect(light.state.colorMode, 'xy');
        final colors = light.colors;

        expect(colors.xy[0], 0.4575);
        expect(colors.xy[1], 0.4101);
        expect(colors.red, 0.9999999999999999);
        expect(colors.green, 0.8108918043577206);
        expect(colors.blue, 0.4688702585134064);
        expect(colors.hue, 7596);
        expect(colors.saturation, 135);
        expect(colors.brightness, 203);
        expect(colors.temperature, 2799);
        expect(colors.ct, 357);
      });

      test('searching for lights', () async {
        mockPost('[{"success":{"/lights":"Searching for new devices"}}]');
        var response = await sut.searchLights();
        expect(response.success.length, 1);
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/lights')));

        response = await sut.searchLights(['45AF34']);
        expect(response.success.length, 1);
        final body = {
          'deviceid': ['45AF34']
        };
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/lights'),
            body: json.encode(body)));
      });

      test('fetch search results', () async {
        mockGet(
            '{"7": {"name": "Hue Lamp 7"},"8": {"name": "Hue Lamp 8"},"lastscan": "2012-10-29T12:00:00"}');
        mockGet(
            '{"state":{"on":false,"bri":244,"hue":14988,"sat":141,"effect":"none","xy":[0.4575,0.4101],"ct":366,"alert":"none","colormode":"ct","mode":"homeautomation","reachable":true},"swupdate":{"state":"noupdates","lastinstall":"2017-11-14T15:47:40"},"type":"Extended color light","name":"Hue Lamp 7","modelid":"LCT007","manufacturername":"Philips","productname":"Hue color lamp","capabilities":{"certified":true,"control":{"mindimlevel":2000,"maxlumen":800,"colorgamuttype":"B","colorgamut":[[0.6750,0.3220],[0.4090,0.5180],[0.1670,0.0400]],"ct":{"min":153,"max":500}},"streaming":{"renderer":true,"proxy":true}},"config":{"archetype":"sultanbulb","function":"mixed","direction":"omnidirectional"},"uniqueid":"22:24:88:01:10:31:62:76-0b","swversion":"5.105.0.21536"}',
            'http://127.0.0.1/api/username/lights/7');
        mockGet(
            '{"state":{"on":false,"bri":244,"hue":14988,"sat":141,"effect":"none","xy":[0.4575,0.4101],"ct":366,"alert":"none","colormode":"ct","mode":"homeautomation","reachable":true},"swupdate":{"state":"noupdates","lastinstall":"2017-11-14T15:47:40"},"type":"Extended color light","name":"Hue Lamp 8","modelid":"LCT007","manufacturername":"Philips","productname":"Hue color lamp","capabilities":{"certified":true,"control":{"mindimlevel":2000,"maxlumen":800,"colorgamuttype":"B","colorgamut":[[0.6750,0.3220],[0.4090,0.5180],[0.1670,0.0400]],"ct":{"min":153,"max":500}},"streaming":{"renderer":true,"proxy":true}},"config":{"archetype":"sultanbulb","function":"mixed","direction":"omnidirectional"},"uniqueid":"22:24:88:01:10:31:62:76-0b","swversion":"5.105.0.21536"}',
            'http://127.0.0.1/api/username/lights/8');
        final response = await sut.lightSearchResults();
        expect(response.first.id, 7);
        expect(response.first.name, 'Hue Lamp 7');
        expect(response[1].id, 8);
        expect(response[1].name, 'Hue Lamp 8');
        verify(
            client.get(Uri.parse('http://127.0.0.1/api/username/lights/new')));
      });

      test('delete light', () async {
        mockDelete('[{"success":"/lights/1 deleted"}]');
        final light = Light((b) => b..id = 1);
        final response = await sut.deleteLight(light);
        verify(
            client.delete(Uri.parse('http://127.0.0.1/api/username/lights/1')));
        expect(response.success.length, 1);
      });
    });

    group('resource link api', () {
      test('all resource links', () async {
        mockGet(allResourceLinks);
        final response = await sut.resourceLinks();
        expect(response.length, 1);
        verify(client
            .get(Uri.parse('http://127.0.0.1/api/username/resourcelinks')));
      });

      test('single resourcelink', () async {
        mockGet(singleResourceLink);
        final resourceLink = await sut.resourceLink('1213');
        expect(resourceLink.name, 'Sunrise');
        expect(resourceLink.description, "Carla's wakeup experience");
        expect(resourceLink.classId, 1);
        expect(resourceLink.owner, '78H56B12BAABCDEF');
        expect(resourceLink.links, [
          "/schedules/2",
          "/schedules/3",
          "/scenes/ABCD",
          "/scenes/EFGH",
          "/groups/8"
        ]);
        verify(client.get(
            Uri.parse('http://127.0.0.1/api/username/resourcelinks/1213')));
      });

      test('create resourcelink', () async {
        mockPost('[{"success":{"id":"1"}}]');
        final resourceLink = ResourceLink((b) => b
          ..name = 'Sunrise'
          ..description = "Carla's wakeup experience"
          ..type = 'Link'
          ..classId = 1
          ..owner = '78H56B12BAABCDEF'
          ..links = ListBuilder([
            "/schedules/2",
            "/schedules/3",
            "/scenes/ABCD",
            "/scenes/EFGH",
            "/groups/8"
          ]));
        final response = await sut.createResourceLink(resourceLink);
        expect(response.id, '1');
        final body = {
          "name": "Sunrise",
          "description": "Carla's wakeup experience",
          "type": "Link",
          "owner": "78H56B12BAABCDEF",
          "classid": 1,
          "links": [
            "/schedules/2",
            "/schedules/3",
            "/scenes/ABCD",
            "/scenes/EFGH",
            "/groups/8"
          ]
        };
        verify(client.post(
            Uri.parse('http://127.0.0.1/api/username/resourcelinks'),
            body: json.encode(body)));
      });

      test('update resourcelink', () async {
        mockPut(
            """[{"success": {"/resourcelinks/1/name": "New Sunrise"}},{"success": {"/resourcelinks/1/description": "Some new wakeup experience"}}]""");
        final resourceLink = ResourceLink((b) => b
          ..id = '1234'
          ..name = 'New Sunrise'
          ..description = 'Some new wakeup experience');
        final response = await sut.updateResourceLink(resourceLink);
        expect(response.success.length, 2);
        final body = {
          "name": "New Sunrise",
          "description": "Some new wakeup experience",
        };
        verify(client.put(
            Uri.parse('http://127.0.0.1/api/username/resourcelinks/1234'),
            body: json.encode(body)));
      });

      test('delete resourcelink', () async {
        mockDelete('[{"success":"/resourcelinks/12345 deleted"}]');
        final resourceLink = ResourceLink((b) => b..id = '12345');
        final response = await sut.deleteResourceLink(resourceLink);
        expect(response.success.length, 1);
        verify(client.delete(
            Uri.parse('http://127.0.0.1/api/username/resourcelinks/12345')));
      });
    });

    group('rule api', () {
      test('all rules', () async {
        mockGet(allRules);
        final response = await sut.rules();
        expect(response.length, 1);
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/rules')));
      });

      test('single rule', () async {
        mockGet(singleRule);
        final rule = await sut.rule(1);
        expect(rule.name, 'Wall Switch Rule');
        expect(rule.lastTriggered, '2013-10-17T01:23:20');
        expectDate(rule.lastTriggeredDate, 2013, 10, 17, 1, 23, 20);
        expect(rule.creationTime, '2013-10-10T21:11:45');
        expectDate(rule.creationTimeDate, 2013, 10, 10, 21, 11, 45);
        expect(rule.timesTriggered, 27);
        expect(rule.owner, '78H56B12BA');
        expect(rule.status, 'enabled');
        expect(rule.conditions.length, 2);
        expect(rule.actions.length, 1);
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/rules/1')));
      });

      test('create rule', () async {
        mockPost('[{"success":{"id":"1"}}]');
        final rule = Rule((b) => b
          ..name = 'Wall Switch'
          ..actions = ListBuilder([
            RuleAction((b) => b
              ..address = '/groups/0/action'
              ..method = 'PUT'
              ..body = MapBuilder<String, String>({'scene': 'S3'}))
          ])
          ..conditions = ListBuilder([
            Condition((b) => b
              ..address = '/sensors/2/state/buttonevent'
              ..operator = 'eq'
              ..value = '16')
          ]));
        final response = await sut.createRule(rule);
        expect(response.id, 1);
        final body = {
          "name": "Wall Switch",
          'conditions': [
            {
              "address": "/sensors/2/state/buttonevent",
              "operator": "eq",
              "value": "16"
            }
          ],
          "actions": [
            {
              "address": "/groups/0/action",
              "method": "PUT",
              "body": {"scene": "S3"}
            }
          ],
        };
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/rules'),
            body: json.encode(body)));
      });

      test('update rule', () async {
        mockPut(
            """[{"success": {"/rules/1/actions": [{"address": "/groups/0/action", "method": "PUT", "body": { "scene": "S3"}}]}}]""");
        final rule = Rule((b) => b
          ..id = 1
          ..name = 'New Wall Switch'
          ..actions = ListBuilder([
            RuleAction((b) => b
              ..address = '/groups/0/action'
              ..method = 'PUT'
              ..body = MapBuilder<String, String>({'scene': 'S3'}))
          ]));

        final response = await sut.updateRule(rule);
        expect(response.success.length, 1);
        final body = {
          "name": "New Wall Switch",
          "actions": [
            {
              "address": "/groups/0/action",
              "method": "PUT",
              "body": {"scene": "S3"}
            }
          ]
        };
        verify(client.put(Uri.parse('http://127.0.0.1/api/username/rules/1'),
            body: json.encode(body)));
      });

      test('delete rule', () async {
        mockDelete('[{"success":"/rules/1 deleted"}]');
        final rule = Rule((b) => b..id = 1);
        final response = await sut.deleteRule(rule);
        expect(response.success.length, 1);
        verify(
            client.delete(Uri.parse('http://127.0.0.1/api/username/rules/1')));
      });
    });

    group('scene api', () {
      test('all scenes', () async {
        mockGet(allScenes);
        final response = await sut.scenes();
        expect(response.length, 4);
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/scenes')));
      });

      test('single scene', () async {
        mockGet(singleScene);
        final scene = await sut.scene('42YARQOHMNIPia6');
        expect(scene.name, 'Relax');
        expect(scene.lightIds.length, 2);
        expect(scene.owner, 'MUSAY5n2PtInw1x3N0mqHEwt6eOBhQqaEucmqvgc');
        expect(scene.recycle, false);
        expect(scene.locked, false);
        expect(scene.appData.version, 1);
        expect(scene.appData.data, '6iELK_r01_d01');
        expect(scene.picture, '');
        expect(scene.lastUpdated, '2017-04-30T15:14:42');
        expectDate(scene.lastUpdatedDate, 2017, 4, 30, 15, 14, 42);
        expect(scene.version, 2);
        verify(client.get(
            Uri.parse('http://127.0.0.1/api/username/scenes/42YARQOHMNIPia6')));
      });

      test('create scene', () async {
        mockPost('[{"success":{"id":"42YARQOHMNIPia6"}}]');
        final scene = Scene((b) => b
          ..name = 'Amazing Scene'
          ..lightIds = ListBuilder(['1', '2']));

        final response = await sut.createScene(scene);
        expect(response.id, '42YARQOHMNIPia6');
        final body = {
          'name': 'Amazing Scene',
          'recycle': false,
          'lights': ['1', '2']
        };
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/scenes'),
            body: json.encode(body)));
      });

      test('update scene attributes', () async {
        mockPut(
            '[{"success":{"/scenes/42YARQOHMNIPia6":["1", "2"]}},{"success":{"/scenes/42YARQOHMNIPia6/name":"New Scene"}}]');
        final scene = Scene((b) => b
          ..id = '42YARQOHMNIPia6'
          ..name = 'New Scene'
          ..lightIds = ListBuilder(['1', '2']));

        final response = await sut.updateSceneAttributes(scene);
        expect(response.success.length, 2);
        final body = {
          'name': 'New Scene',
          'lights': ['1', '2']
        };
        verify(client.put(
            Uri.parse('http://127.0.0.1/api/username/scenes/42YARQOHMNIPia6'),
            body: json.encode(body)));
      });

      test('update scene light state', () async {
        mockPut(
            '[{"success":{"address":"/scenes/ab341ef24/lights/1/state/on", "value":true}},{"success":{"address":"/scenes/ab341ef24/lights/1/state/hue", "value":144}}, {"success":{"address":"/scenes/ab341ef24/lights/1/state/effect", "value":"none"}}]');
        final light = Light(
          (b) => b
            ..id = 1
            ..state.replace(
              LightState((b) => b
                ..on = true
                ..hue = 144
                ..effect = 'none'),
            ),
        );
        final scene = Scene((b) => b
          ..id = '42YARQOHMNIPia6'
          ..sceneLights = ListBuilder([light]));

        final response = await sut.updateSceneLightState(scene, light);
        expect(response.success.length, 3);
        final body = {'on': true, 'hue': 144, 'effect': 'none'};
        verify(client.put(
            Uri.parse(
                'http://127.0.0.1/api/username/scenes/42YARQOHMNIPia6/lightstates/1'),
            body: json.encode(body)));
      });

      test('delete scene', () async {
        mockDelete('[{"success":"/scenes/42YARQOHMNIPia6 deleted"}]');
        final scene = Scene((b) => b..id = '42YARQOHMNIPia6');
        final response = await sut.deleteScene(scene);
        expect(response.success.length, 1);
        verify(client.delete(
            Uri.parse('http://127.0.0.1/api/username/scenes/42YARQOHMNIPia6')));
      });
    });

    group('schedule api', () {
      test('all schedules', () async {
        mockGet(allSchedules);
        final response = await sut.schedules();
        expect(response.length, 10);
        verify(
            client.get(Uri.parse('http://127.0.0.1/api/username/schedules')));
        var schedule = response[0];
        //absolute alarm
        expect(schedule.type.runtimeType.toString(), 'Alarm');
        var alarm = schedule.type as Alarm;
        expectDate(alarm.date, 2018, 7, 15, 5, 30, 0);
        expect(alarm.randomTime, isNull);
        expect(alarm.weekDays, isNull);
        expect(alarm.endDate, isNull);

        schedule = response[1];
        // randomized absolute alarm
        expect(schedule.type.runtimeType.toString(), 'Alarm');
        alarm = schedule.type as Alarm;
        expectDate(alarm.date, 2018, 7, 15, 5, 30, 0);
        expectDate(alarm.randomTime, 1970, 1, 1, 20, 44, 53);
        expect(alarm.weekDays, isNull);
        expect(alarm.endDate, isNull);

        schedule = response[2];
        // recurring alarm
        expect(schedule.type.runtimeType.toString(), 'Alarm');
        alarm = schedule.type as Alarm;
        expectDate(alarm.date, 1970, 1, 1, 5, 30, 0);
        expect(alarm.randomTime, isNull);
        expect(alarm.weekDays, 124);
        expect(alarm.endDate, isNull);

        schedule = response[3];
        // recurring random alarm
        expect(schedule.type.runtimeType.toString(), 'Alarm');
        alarm = schedule.type as Alarm;
        expectDate(alarm.date, 1970, 1, 1, 23, 30, 0);
        expectDate(alarm.randomTime, 1970, 1, 1, 20, 13, 0);
        expect(alarm.weekDays, 127);
        expect(alarm.endDate, isNull);

        schedule = response[4];
        // time interval alarm
        expect(schedule.type.runtimeType.toString(), 'Alarm');
        alarm = schedule.type as Alarm;
        expectDate(alarm.date, 1970, 1, 1, 3, 30, 0);
        expectDate(alarm.endDate, 1970, 1, 1, 20, 13, 0);
        expect(alarm.randomTime, isNull);
        expect(alarm.weekDays, isNull);

        schedule = response[5];
        //expiring timer
        expect(schedule.type.runtimeType.toString(), 'Timer');
        var timer = schedule.type as Timer;
        expectDate(timer.date, 1970, 1, 1, 20, 13, 0);
        expect(timer.randomTime, isNull);
        expect(timer.recurrence, isNull);

        schedule = response[6];
        //expiring random timer
        expect(schedule.type.runtimeType.toString(), 'Timer');
        timer = schedule.type as Timer;
        expectDate(timer.date, 1970, 1, 1, 20, 13, 0);
        expectDate(timer.randomTime, 1970, 1, 1, 2, 23, 0);
        expect(timer.recurrence, isNull);

        schedule = response[7];
        //recurring timer 1
        expect(schedule.type.runtimeType.toString(), 'Timer');
        timer = schedule.type as Timer;
        expectDate(timer.date, 1970, 1, 1, 20, 13, 0);
        expect(timer.randomTime, isNull);
        expect(timer.recurrence, 12);

        schedule = response[8];
        //recurring timer 1
        expect(schedule.type.runtimeType.toString(), 'Timer');
        timer = schedule.type as Timer;
        expectDate(timer.date, 1970, 1, 1, 20, 13, 0);
        expect(timer.randomTime, isNull);
        expect(timer.recurrence, 0);

        schedule = response[9];
        //random recurring timer
        expect(schedule.type.runtimeType.toString(), 'Timer');
        timer = schedule.type as Timer;
        expectDate(timer.date, 1970, 1, 1, 20, 13, 0);
        expectDate(timer.randomTime, 1970, 1, 1, 2, 30, 0);
        expect(timer.recurrence, 12);
      });

      test('single schedule', () async {
        mockGet(singleSchedule);
        final schedule = await sut.schedule('7796503114448045');
        expect(schedule.name, 'Sleep');
        expect(schedule.description, '');
        expect(schedule.command.address,
            '/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action');
        expect(schedule.command.method, 'PUT');
        expect(schedule.command.body.toMap(), {"scene": "04f61b745-off-5"});
        expect(schedule.time, 'W127/T23:30:00');
        expect(schedule.status, 'disabled');
        expect(schedule.recycle, false);
        verify(client.get(Uri.parse(
            'http://127.0.0.1/api/username/schedules/7796503114448045')));
      });

      test('create schedule', () async {
        mockPost('[{"success":{"id":"7796503114448045"}}]');
        final schedule = Schedule((b) => b
          ..name = 'Super Schedule'
          ..time = 'W124/T05:30:00'
          ..command.replace(
            Command((b) => b
              ..address = '/api/username/groups/0/action'
              ..method = 'PUT'
              ..body = BuiltMap<String, String>({"scene": "22227461b-on-0"})
                  .toBuilder()),
          ));

        final response = await sut.createSchedule(schedule);
        expect(response.id, '7796503114448045');
        final body = {
          'name': 'Super Schedule',
          'description': '',
          'localtime': 'W124/T05:30:00',
          'command': {
            "address": "/api/username/groups/0/action",
            "method": "PUT",
            "body": {"scene": "22227461b-on-0"}
          },
          'status': 'enabled',
          'autodelete': true,
          'recycle': false,
        };
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/schedules'),
            body: json.encode(body)));
      });

      test('update schedule', () async {
        mockPut(
            '[{"success":{"/schedules/7796503114448045/name": "New Schedule"}}]');
        final schedule = Schedule((b) => b
          ..id = '7796503114448045'
          ..name = 'New Schedule');

        final response = await sut.updateScheduleAttributes(schedule);
        expect(response.success.length, 1);
        final body = {'name': 'New Schedule'};
        verify(client.put(
            Uri.parse(
                'http://127.0.0.1/api/username/schedules/7796503114448045'),
            body: json.encode(body)));
      });

      test('delete schedule', () async {
        mockDelete('[{"success":"/schedules/7796503114448045 deleted"}]');
        final schedule = Schedule((b) => b..id = '7796503114448045');
        final response = await sut.deleteSchedule(schedule);
        expect(response.success.length, 1);
        verify(client.delete(Uri.parse(
            'http://127.0.0.1/api/username/schedules/7796503114448045')));
      });
    });

    group('sensor api', () {
      test('all sensors', () async {
        mockGet(allSensors);
        final lights = await sut.sensors();
        expect(lights, isNotNull);
        expect(lights.length, 4);
        verify(client.get(Uri.parse('http://127.0.0.1/api/username/sensors')));
      });

      test('single sensors', () async {
        mockGet(singleSensor);
        final sensor = await sut.sensor('4');
        verify(
            client.get(Uri.parse('http://127.0.0.1/api/username/sensors/4')));
        expect(sensor, isNotNull);
        expect(sensor.config.on, true);
        expect(sensor.config.battery, 100);
        expect(sensor.config.reachable, true);
        expect(sensor.state.presence, false);
        expect(sensor.state.lastUpdated, '2018-07-13T06:43:41');
        expect(sensor.name, 'Hue motion sensor 1');
        expect(sensor.type, 'ZLLPresence');
        expect(sensor.modelId, 'SML001');
        expect(sensor.manufacturerName, 'Philips');
        expect(sensor.swVersion, '6.1.0.18912');
        expect(sensor.uniqueId, '22:24:88:01:02:00:d2:ce-02-0406');
      });

      test('test sensor model ids', () async {
        testModelId(
            String modelId, String runtimeType, String productName) async {
          mockGet(singleSensorModelIdPlaceholder.replaceFirst(
              '<model_id>', modelId));
          final sensor = await sut.sensor('1');
          expect(sensor.model.modelId, modelId);
          expect(sensor.model.runtimeType.toString(), runtimeType);
          expect(sensor.model.productName, productName);
        }

        List<Map<String, String>> models = [
          {
            'id': 'PHDL00',
            'runtimeType': 'DayLight',
            'productName': 'DayLight'
          },
          {
            'id': 'RWL020',
            'runtimeType': 'Dimmer',
            'productName': 'Hue Wireless Dimmer'
          },
          {
            'id': 'RWL021',
            'runtimeType': 'Dimmer',
            'productName': 'Hue Wireless Dimmer'
          },
          {
            'id': 'SML001',
            'runtimeType': 'Motion',
            'productName': 'Hue Motion Sensor'
          },
          {'id': 'ZGPSWITCH', 'runtimeType': 'Tap', 'productName': 'Hue Tap'}
        ];
        for (Map<String, String> model in models) {
          testModelId(model['id'], model['runtimeType'], model['productName']);
        }
      });

      test('create sensor', () async {
        mockPost('[{"success":{"id":"10"}}]');
        final sensor = Sensor((b) => b
          ..name = 'Super Tap'
          ..modelId = 'modelid'
          ..swVersion = '1.0.0'
          ..type = 'sensor type'
          ..uniqueId = 'very_unique_id'
          ..manufacturerName = 'Jairzinno');

        final response = await sut.createSensor(sensor);
        expect(response.id, 10);
        final body = {
          'type': 'sensor type',
          'name': 'Super Tap',
          'modelid': 'modelid',
          'uniqueid': 'very_unique_id',
          'manufacturername': 'Jairzinno',
          'swversion': '1.0.0'
        };
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/sensors'),
            body: json.encode(body)));
      });

      test('update sensor attributes', () async {
        mockPut('[{"success":{"/sensors/2/name":"Room 1 Tap"}}]');
        final sensor = Sensor((b) => b
          ..id = 4
          ..name = 'Room 1 Tap');
        final result = await sut.updateSensorAttributes(sensor);
        expect(result.success.length, 1);
        expect(result.errors.length, 0);
        final body = {'name': 'Room 1 Tap'};
        verify(client.put(Uri.parse('http://127.0.0.1/api/username/sensors/4'),
            body: json.encode(body)));
      });

      test('update sensor config', () async {
        mockPut('[{"success":{"/sensors/4/config/on": true}}]');
        final sensor = Sensor((b) => b
          ..id = 4
          ..config.replace(SensorConfig((b) => b..on = true)));

        final result = await sut.updateSensorConfig(sensor);
        expect(result.success.length, 1);
        expect(result.errors.length, 0);
        final body = {"on": true};
        verify(client.put(
            Uri.parse('http://127.0.0.1/api/username/sensors/4/config'),
            body: json.encode(body)));
      });

      test('searching for sensors', () async {
        mockPost('[{"success":{"/sensors":"Searching for new devices"}}]');
        var response = await sut.searchSensors();
        expect(response.success.length, 1);
        verify(client.post(Uri.parse('http://127.0.0.1/api/username/sensors')));
      });

      test('fetch search results', () async {
        mockGet(
            '{"7": {"name": "Hue Tap 1"},"8": {"name": "Hue Motion 1"},"lastscan": "2012-10-29T12:00:00"}');
        final response = await sut.sensorSearchResults();
        expect(response.first.id, 7);
        expect(response[1].id, 8);
        verify(
            client.get(Uri.parse('http://127.0.0.1/api/username/sensors/new')));
      });

      test('delete sensor', () async {
        mockDelete('[{"success":"/sensors/4 deleted"}]');
        final sensor = Sensor((b) => b..id = 4);
        final response = await sut.deleteSensor(sensor);
        verify(client
            .delete(Uri.parse('http://127.0.0.1/api/username/sensors/4')));
        expect(response.success.length, 1);
      });
    });
  });
}

const String config = """
{
	"name": "Philips hue",
	"zigbeechannel": 11,
	"bridgeid": "001788FFFE256501",
	"mac": "22:24:88:52:56:01",
	"dhcp": true,
	"ipaddress": "192.168.2.100",
	"netmask": "255.255.255.0",
	"gateway": "192.168.2.240",
	"proxyaddress": "none",
	"proxyport": 0,
	"UTC": "2018-07-13T08:55:22",
	"localtime": "2018-07-13T10:55:22",
	"timezone": "Europe/Amsterdam",
	"modelid": "BSB002",
	"datastoreversion": "71",
	"swversion": "1806051111",
	"apiversion": "1.26.0",
	"swupdate": {
		"updatestate": 0,
		"checkforupdate": false,
		"devicetypes": {
			"bridge": false,
			"lights": [],
			"sensors": []
		},
		"url": "",
		"text": "",
		"notify": true
	},
	"swupdate2": {
		"checkforupdate": false,
		"lastchange": "2018-06-29T21:53:49",
		"bridge": {
			"state": "noupdates",
			"lastinstall": "2018-06-29T21:49:53"
		},
		"state": "noupdates",
		"autoinstall": {
			"updatetime": "T23:00:00",
			"on": true
		}
	},
	"linkbutton": false,
	"portalservices": true,
	"portalconnection": "connected",
	"portalstate": {
		"signedon": true,
		"incoming": false,
		"outgoing": true,
		"communication": "disconnected"
	},
	"internetservices": {
		"internet": "connected",
		"remoteaccess": "connected",
		"time": "connected",
		"swupdate": "connected"
	},
	"factorynew": false,
	"replacesbridgeid": null,
	"backup": {
		"status": "idle",
		"errorcode": 0
	},
	"starterkitid": "",
	"whitelist": {
		"688a789c0bd6442e48969b1d945920": {
			"last use date": "2016-07-10T19:47:00",
			"create date": "2016-07-10T19:47:00",
			"name": "my_hue_app#test"
		},
		"WrFwPR0pthXiuAU5SD-CndT7OCLFa2JK6rvEoGadc": {
			"last use date": "2017-02-24T20:09:19",
			"create date": "2017-02-24T20:09:19",
			"name": "my_hue_app#test"
		},
		"UHoFRTUaGrPGxis4F6BUsf8v4MMYxPGvcy3a3re23": {
			"last use date": "2018-07-13T08:55:22",
			"create date": "2018-06-30T11:32:34",
			"name": "my_hue_app#debug"
		}
	}
}""";
const String fullState = """
{
	"lights": {
		"1": {
			"state": {
				"on": false,
				"bri": 56,
				"hue": 0,
				"sat": 254,
				"effect": "none",
				"xy": [
					0.675,
					0.322
				],
				"ct": 153,
				"alert": "none",
				"colormode": "xy",
				"mode": "homeautomation",
				"reachable": true
			},
			"swupdate": {
				"state": "noupdates",
				"lastinstall": "2017-11-14T15:47:40"
			},
			"type": "Extended color light",
			"name": "Room 1",
			"modelid": "LCT007",
			"manufacturername": "Philips",
			"productname": "Hue color lamp",
			"capabilities": {
				"certified": true,
				"control": {
					"mindimlevel": 2000,
					"maxlumen": 800,
					"colorgamuttype": "B",
					"colorgamut": [
						[
							0.675,
							0.322
						],
						[
							0.409,
							0.518
						],
						[
							0.167,
							0.04
						]
					],
					"ct": {
						"min": 153,
						"max": 500
					}
				},
				"streaming": {
					"renderer": true,
					"proxy": true
				}
			},
			"config": {
				"archetype": "sultanbulb",
				"function": "mixed",
				"direction": "omnidirectional"
			},
			"uniqueid": "22:24:88:01:10:31:62:76-0b",
			"swversion": "5.105.0.21536"
		},
		"2": {
			"state": {
				"on": false,
				"bri": 127,
				"hue": 14780,
				"sat": 151,
				"effect": "none",
				"xy": [
					0.4642,
					0.4115
				],
				"ct": 379,
				"alert": "none",
				"colormode": "ct",
				"mode": "homeautomation",
				"reachable": true
			},
			"swupdate": {
				"state": "noupdates",
				"lastinstall": "2017-11-14T15:46:34"
			},
			"type": "Extended color light",
			"name": "Room 3 links",
			"modelid": "LCT007",
			"manufacturername": "Philips",
			"productname": "Hue color lamp",
			"capabilities": {
				"certified": true,
				"control": {
					"mindimlevel": 2000,
					"maxlumen": 800,
					"colorgamuttype": "B",
					"colorgamut": [
						[
							0.675,
							0.322
						],
						[
							0.409,
							0.518
						],
						[
							0.167,
							0.04
						]
					],
					"ct": {
						"min": 153,
						"max": 500
					}
				},
				"streaming": {
					"renderer": true,
					"proxy": true
				}
			},
			"config": {
				"archetype": "sultanbulb",
				"function": "mixed",
				"direction": "omnidirectional"
			},
			"uniqueid": "22:24:88:01:10:31:59:11-0b",
			"swversion": "5.105.0.21536"
		},
		"3": {
			"state": {
				"on": true,
				"bri": 254,
				"hue": 14988,
				"sat": 141,
				"effect": "none",
				"xy": [
					0.4575,
					0.4101
				],
				"ct": 366,
				"alert": "none",
				"colormode": "ct",
				"mode": "homeautomation",
				"reachable": false
			},
			"swupdate": {
				"state": "noupdates",
				"lastinstall": null
			},
			"type": "Extended color light",
			"name": "Badkamer 1",
			"modelid": "LCT007",
			"manufacturername": "Philips",
			"productname": "Hue color lamp",
			"capabilities": {
				"certified": true,
				"control": {
					"mindimlevel": 2000,
					"maxlumen": 800,
					"colorgamuttype": "B",
					"colorgamut": [
						[
							0.675,
							0.322
						],
						[
							0.409,
							0.518
						],
						[
							0.167,
							0.04
						]
					],
					"ct": {
						"min": 153,
						"max": 500
					}
				},
				"streaming": {
					"renderer": true,
					"proxy": true
				}
			},
			"config": {
				"archetype": "sultanbulb",
				"function": "mixed",
				"direction": "omnidirectional"
			},
			"uniqueid": "22:24:88:01:10:47:0f:18-0b",
			"swversion": "5.105.0.21536"
		}
	},
	"groups": {
		"1": {
			"name": "Room 2",
			"lights": [
				"17",
				"15"
			],
			"type": "Room",
			"state": {
				"all_on": false,
				"any_on": false
			},
			"recycle": false,
			"class": "Living room",
			"action": {
				"on": false,
				"bri": 144,
				"hue": 7688,
				"sat": 199,
				"effect": "none",
				"xy": [
					0.5014,
					0.4153
				],
				"ct": 447,
				"alert": "none",
				"colormode": "ct"
			}
		},
		"2": {
			"name": "Room 3",
			"lights": [
				"12",
				"2"
			],
			"type": "Room",
			"state": {
				"all_on": false,
				"any_on": false
			},
			"recycle": false,
			"class": "Dining",
			"action": {
				"on": false,
				"bri": 127,
				"hue": 14780,
				"sat": 151,
				"effect": "none",
				"xy": [
					0.4642,
					0.4115
				],
				"ct": 379,
				"alert": "none",
				"colormode": "ct"
			}
		},
		"3": {
			"name": "Kitchen",
			"lights": [
				"9"
			],
			"type": "Room",
			"state": {
				"all_on": false,
				"any_on": false
			},
			"recycle": false,
			"class": "Kitchen",
			"action": {
				"on": false,
				"bri": 254,
				"hue": 13524,
				"sat": 200,
				"effect": "none",
				"xy": [
					0.5017,
					0.4152
				],
				"ct": 443,
				"alert": "none",
				"colormode": "xy"
			}
		}
	},
	"config": {
		"name": "Philips hue",
		"zigbeechannel": 11,
		"bridgeid": "001788FFFE256501",
		"mac": "22:24:88:52:56:01",
		"dhcp": true,
		"ipaddress": "192.168.2.100",
		"netmask": "255.255.255.0",
		"gateway": "192.168.2.240",
		"proxyaddress": "none",
		"proxyport": 0,
		"UTC": "2018-07-13T08:55:22",
		"localtime": "2018-07-13T10:55:22",
		"timezone": "Europe/Amsterdam",
		"modelid": "BSB002",
		"datastoreversion": "71",
		"swversion": "1806051111",
		"apiversion": "1.26.0",
		"swupdate": {
			"updatestate": 0,
			"checkforupdate": false,
			"devicetypes": {
				"bridge": false,
				"lights": [],
				"sensors": []
			},
			"url": "",
			"text": "",
			"notify": true
		},
		"swupdate2": {
			"checkforupdate": false,
			"lastchange": "2018-06-29T21:53:49",
			"bridge": {
				"state": "noupdates",
				"lastinstall": "2018-06-29T21:49:53"
			},
			"state": "noupdates",
			"autoinstall": {
				"updatetime": "T23:00:00",
				"on": true
			}
		},
		"linkbutton": false,
		"portalservices": true,
		"portalconnection": "connected",
		"portalstate": {
			"signedon": true,
			"incoming": false,
			"outgoing": true,
			"communication": "disconnected"
		},
		"internetservices": {
			"internet": "connected",
			"remoteaccess": "connected",
			"time": "connected",
			"swupdate": "connected"
		},
		"factorynew": false,
		"replacesbridgeid": null,
		"backup": {
			"status": "idle",
			"errorcode": 0
		},
		"starterkitid": "",
		"whitelist": {
			"688a789c0bd6442e48969b1d945920": {
				"last use date": "2016-07-10T19:47:00",
				"create date": "2016-07-10T19:47:00",
				"name": "my_hue_app#test"
			},
			"14a930704b59a4547a9cbfe24787daaa": {
				"last use date": "2016-10-16T18:42:29",
				"create date": "2016-07-10T19:56:44",
				"name": "my_hue_app#test"
			},
			"20ff76483eecadcb209fbb403c602466": {
				"last use date": "2016-12-28T09:02:31",
				"create date": "2016-07-10T19:57:38",
				"name": "my_hue_app#debug"
			}
		}
	},
	"schedules": {
		"4180398747470589": {
			"name": "Running",
			"description": "Running",
			"command": {
				"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
				"body": {
					"scene": "22227461b-on-0"
				},
				"method": "PUT"
			},
			"localtime": "W124/T05:30:00",
			"time": "W124/T03:30:00",
			"created": "2016-07-10T20:26:36",
			"status": "disabled",
			"recycle": false
		},
		"7796503114448045": {
			"name": "Sleep",
			"description": "",
			"command": {
				"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
				"body": {
					"scene": "04f61b745-off-5"
				},
				"method": "PUT"
			},
			"localtime": "W127/T23:30:00",
			"time": "W127/T21:30:00",
			"created": "2016-07-10T20:27:05",
			"status": "disabled",
			"recycle": false
		},
		"8457714839918082": {
			"name": "Recurring Alarm weg",
			"description": "",
			"command": {
				"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
				"body": {
					"scene": "04f61b745-off-0"
				},
				"method": "PUT"
			},
			"localtime": "W127/T06:00:00",
			"time": "W127/T04:00:00",
			"created": "2016-07-11T21:32:50",
			"status": "disabled",
			"recycle": false
		}
	},
	"scenes": {
		"497b50d84-on-0": {
			"name": "Sunset on 0",
			"lights": [
				"1",
				"2",
				"3"
			],
			"owner": "none",
			"recycle": true,
			"locked": false,
			"appdata": {},
			"picture": "",
			"lastupdated": null,
			"version": 1
		},
		"c4a83e4d1-on-0": {
			"name": "Pencils on 0",
			"lights": [
				"1",
				"2",
				"3"
			],
			"owner": "14a930704b59a4547a9cbfe24787daaa",
			"recycle": true,
			"locked": false,
			"appdata": {},
			"picture": "",
			"lastupdated": "2016-07-10T20:10:59",
			"version": 1
		},
		"1437fcf21-on-0": {
			"name": "Pencils on 0",
			"lights": [
				"1",
				"2",
				"3",
				"4",
				"5",
				"6",
				"7",
				"8",
				"9"
			],
			"owner": "14a930704b59a4547a9cbfe24787daaa",
			"recycle": true,
			"locked": false,
			"appdata": {},
			"picture": "",
			"lastupdated": "2016-07-10T20:11:37",
			"version": 1
		}
	},
	"rules": {
		"1": {
			"name": "1:huelabs/tap-toggle",
			"owner": "LSsphi0zRV75VRpFJ3l73TdxdET-ZKbTHrYHaPSs",
			"created": "2017-11-10T17:48:36",
			"lasttriggered": "2018-07-13T05:40:23",
			"timestriggered": 14,
			"status": "enabled",
			"recycle": true,
			"conditions": [
				{
					"address": "/sensors/2/state/buttonevent",
					"operator": "eq",
					"value": "17"
				},
				{
					"address": "/sensors/2/state/lastupdated",
					"operator": "dx"
				},
				{
					"address": "/groups/5/state/any_on",
					"operator": "eq",
					"value": "false"
				}
			],
			"actions": [
				{
					"address": "/groups/5/action",
					"method": "PUT",
					"body": {
						"on": "true"
					}
				}
			]
		},
		"2": {
			"name": "Tap 2.1",
			"owner": "MUSAY5n2PtInw1x3N0mqHEwt6eOBhQqaEucmqvgc",
			"created": "2017-08-26T18:43:56",
			"lasttriggered": "2018-07-12T05:00:41",
			"timestriggered": 32,
			"status": "enabled",
			"recycle": false,
			"conditions": [
				{
					"address": "/sensors/2/state/buttonevent",
					"operator": "eq",
					"value": "34"
				},
				{
					"address": "/sensors/2/state/lastupdated",
					"operator": "dx"
				}
			],
			"actions": [
				{
					"address": "/groups/0/action",
					"method": "PUT",
					"body": {
						"on": "false"
					}
				}
			]
		},
		"3": {
			"name": "1:huelabs/tap-toggle",
			"owner": "LSsphi0zRV75VRpFJ3l73TdxdET-ZKbTHrYHaPSs",
			"created": "2017-11-10T20:13:19",
			"lasttriggered": "2018-07-12T04:27:30",
			"timestriggered": 10,
			"status": "enabled",
			"recycle": true,
			"conditions": [
				{
					"address": "/sensors/2/state/buttonevent",
					"operator": "eq",
					"value": "16"
				},
				{
					"address": "/sensors/2/state/lastupdated",
					"operator": "dx"
				},
				{
					"address": "/groups/9/state/any_on",
					"operator": "eq",
					"value": "false"
				}
			],
			"actions": [
				{
					"address": "/groups/9/action",
					"method": "PUT",
					"body": {
						"scene": "iLiJUOmLQdQVbwj"
					}
				}
			]
		}
	},
	"sensors": {
		"1": {
			"state": {
				"daylight": null,
				"lastupdated": "none"
			},
			"config": {
				"on": true,
				"configured": false,
				"sunriseoffset": 30,
				"sunsetoffset": -30
			},
			"name": "Daylight",
			"type": "Daylight",
			"modelid": "PHDL00",
			"manufacturername": "Philips",
			"swversion": "1.0"
		},
		"2": {
			"state": {
				"buttonevent": 17,
				"lastupdated": "2018-07-13T05:42:24"
			},
			"swupdate": {
				"state": "notupdatable",
				"lastinstall": null
			},
			"config": {
				"on": true
			},
			"name": "Hue tap switch 1",
			"type": "ZGPSwitch",
			"modelid": "ZGPSWITCH",
			"manufacturername": "Philips",
			"productname": "Hue tap switch",
			"uniqueid": "00:00:00:00:00:41:e2:b8-f2",
			"capabilities": {
				"certified": true
			}
		},
		"3": {
			"state": {
				"temperature": 2440,
				"lastupdated": "2018-07-13T10:04:46"
			},
			"swupdate": {
				"state": "noupdates",
				"lastinstall": null
			},
			"config": {
				"on": true,
				"battery": 100,
				"reachable": true,
				"alert": "none",
				"ledindication": false,
				"usertest": false,
				"pending": []
			}
		}
	},
	"resourcelinks": {
		"9910": {
			"name": "Tap toggle (2)",
			"description": "d26b0e8590dcdbc2ea5315cba05ac8ae:0:47806f84e350ced0993f7cdeaab1",
			"type": "Link",
			"classid": 2,
			"owner": "LSsphi0zRV75VRpFJ3l73TdxdET-ZKbTHrYHaPSs",
			"recycle": true,
			"links": [
				"/rules/1",
				"/rules/23"
			]
		},
		"22726": {
			"name": "Tap toggle (3)",
			"description": "d26b0e8590dcdbc2ea5315cba05ac8ae:0:47806f84e350ced0993f7cdeaab1",
			"type": "Link",
			"classid": 2,
			"owner": "LSsphi0zRV75VRpFJ3l73TdxdET-ZKbTHrYHaPSs",
			"recycle": true,
			"links": [
				"/rules/4",
				"/rules/24"
			]
		},
		"25978": {
			"name": "Living scenes (2)",
			"description": "204c310ce986aa919980e87993c2a0a1:0:b40f41fa10291ecada468c79229b",
			"type": "Link",
			"classid": 2,
			"owner": "LSsphi0zRV75VRpFJ3l73TdxdET-ZKbTHrYHaPSs",
			"recycle": true,
			"links": [
				"/sensors/9",
				"/sensors/10",
				"/rules/25",
				"/rules/26",
				"/rules/27",
				"/rules/28",
				"/rules/29",
				"/rules/30",
				"/rules/31",
				"/rules/32",
				"/rules/33"
			]
		}
	}
}""";
const String allLights =
    """{"1":{"modelid":"LCT001","name":"Crazy Name","swversion":"65003148","state":{"xy":[0.168,0.041],"ct":0,"alert":"none","sat":254,"effect":"none","bri":10,"hue":4444,"colormode":"hs","reachable":true,"on":true},"type":"Extended color light","pointsymbol":{"1":"none","2":"none","3":"none","4":"none","5":"none","6":"none","7":"none","8":"none"},"uniqueid":"22:24:88:01:00:d4:12:08-0a"},"2":{"modelid":"LCT001","name":"Hue Lamp 2","swversion":"65003148","state":{"xy":[0.346,0.3568],"ct":201,"alert":"none","sat":144,"effect":"none","bri":254,"hue":23536,"colormode":"hs","reachable":true,"on":true},"type":"Extended color light","pointsymbol":{"1":"none","2":"none","3":"none","4":"none","5":"none","6":"none","7":"none","8":"none"},"uniqueid":"22:24:88:01:00:d4:12:08-0b"},"3":{"modelid":"LCT001","name":"Hue Lamp 3","swversion":"65003148","state":{"xy":[0.346,0.3568],"ct":201,"alert":"none","sat":254,"effect":"none","bri":254,"hue":65136,"colormode":"hs","reachable":true,"on":true},"type":"Extended color light","pointsymbol":{"1":"none","2":"none","3":"none","4":"none","5":"none","6":"none","7":"none","8":"none"},"uniqueid":"22:24:88:01:00:d4:12:08-0c"},"4":{"modelid":"LWB004","name":"New white Light - 4","swversion":"65003148","state":{"alert":"none","bri":254,"reachable":true,"on":true},"type":"Dimmable light","pointsymbol":{"1":"none","2":"none","3":"none","4":"none","5":"none","6":"none","7":"none","8":"none"},"uniqueid":"c6:52:89:2d:98:11:61:67-80"}}""";
const String singleLight =
    '{"state":{"on":false,"bri":244,"hue":14988,"sat":141,"effect":"none","xy":[0.4575, 0.4101],"ct":366,"alert":"none","colormode":"ct","mode":"homeautomation","reachable":true},"swupdate":{"state":"noupdates","lastinstall":"2017-11-14T15:47:40"},"type":"Extended color light","name":"Room 2","modelid":"LCT007","manufacturername":"Philips","productname":"Hue color lamp","capabilities":{"certified":true,"control":{"mindimlevel":2000,"maxlumen":800,"colorgamuttype":"B","colorgamut":[[0.6750,0.3220],[0.4090,0.5180],[0.1670,0.0400]],"ct":{"min":153,"max":500}},"streaming":{"renderer":true,"proxy":true}},"config":{"archetype":"sultanbulb","function":"mixed","direction":"omnidirectional"},"uniqueid":"22:24:88:01:10:31:62:76-0b","swversion":"5.105.0.21536"}';
const String singleLightColorModePlaceHolder =
    '{"state":{"on":false, "bri": 250, "hue": 48420, "sat": 254,"effect":"none","xy":[0.4575, 0.4101],"ct":366,"alert":"none","colormode":"<color_mode>","mode":"homeautomation","reachable":true},"swupdate":{"state":"noupdates","lastinstall":"2017-11-14T15:47:40"},"type":"Extended color light","name":"Room 2","modelid":"LCT007","manufacturername":"Philips","productname":"Hue color lamp","capabilities":{"certified":true,"control":{"mindimlevel":2000,"maxlumen":800,"colorgamuttype":"B","colorgamut":[[0.6750,0.3220],[0.4090,0.5180],[0.1670,0.0400]],"ct":{"min":153,"max":500}},"streaming":{"renderer":true,"proxy":true}},"config":{"archetype":"sultanbulb","function":"mixed","direction":"omnidirectional"},"uniqueid":"22:24:88:01:10:31:62:76-0b","swversion":"5.105.0.21536"}';
const String singleLightModelIdPlaceholder =
    '{"state":{"on":false,"bri":244,"hue":14988,"sat":141,"effect":"none","xy":[0.4575,0.4101],"ct":366,"alert":"none","colormode":"ct","mode":"homeautomation","reachable":true},"swupdate":{"state":"noupdates","lastinstall":"2017-11-14T15:47:40"},"type":"Extended color light","name":"Room 2","modelid":"<model_id>","manufacturername":"Philips","productname":"Hue color lamp","capabilities":{"certified":true,"control":{"mindimlevel":2000,"maxlumen":800,"colorgamuttype":"B","colorgamut":[[0.6750,0.3220],[0.4090,0.5180],[0.1670,0.0400]],"ct":{"min":153,"max":500}},"streaming":{"renderer":true,"proxy":true}},"config":{"archetype":"sultanbulb","function":"mixed","direction":"omnidirectional"},"uniqueid":"22:24:88:01:10:31:62:76-0b","swversion":"5.105.0.21536"}';
const String allGroups = """{
	"1": {
		"name": "Room 2",
		"lights": [
			"17",
			"15"
		],
		"type": "Room",
		"state": {
			"all_on": false,
			"any_on": false
		},
		"recycle": false,
		"class": "Living room",
		"action": {
			"on": false,
			"bri": 144,
			"hue": 7688,
			"sat": 199,
			"effect": "none",
			"xy": [
				0.5014,
				0.4153
			],
			"ct": 447,
			"alert": "none",
			"colormode": "ct"
		}
	},
	"2": {
		"name": "Room 3",
		"lights": [
			"12",
			"2"
		],
		"type": "Room",
		"state": {
			"all_on": false,
			"any_on": false
		},
		"recycle": false,
		"class": "Dining",
		"action": {
			"on": false,
			"bri": 127,
			"hue": 14780,
			"sat": 151,
			"effect": "none",
			"xy": [
				0.4642,
				0.4115
			],
			"ct": 379,
			"alert": "none",
			"colormode": "ct"
		}
	},
	"3": {
		"name": "Kitchen",
		"lights": [
			"9"
		],
		"type": "Room",
		"state": {
			"all_on": false,
			"any_on": false
		},
		"recycle": false,
		"class": "Kitchen",
		"action": {
			"on": false,
			"bri": 254,
			"hue": 13524,
			"sat": 200,
			"effect": "none",
			"xy": [
				0.5017,
				0.4152
			],
			"ct": 443,
			"alert": "none",
			"colormode": "xy"
		}
	}
}""";
const String singleGroup = """{
	"name": "Room 2",
	"lights": [
		"17",
		"15"
	],
	"type": "Room",
	"state": {
		"all_on": false,
		"any_on": false
	},
	"recycle": false,
	"class": "Living room",
	"action": {
		"on": false,
		"bri": 144,
		"hue": 7688,
		"sat": 199,
		"effect": "none",
		"xy": [
			0.5014,
			0.4153
		],
		"ct": 447,
		"alert": "none",
		"colormode": "ct"
	}
}""";
const String allResourceLinks = """{
"1": {
    "name": "Sunrise",
    "description": "Carla's wakeup experience",
    "classid": 1,
    "owner": "78H56B12BAABCDEF",
    "links": ["/schedules/2", "/schedules/3",
              "/scenes/ABCD", "/scenes/EFGH", "/groups/8"]
     }
     }""";
const String singleResourceLink = """{
    "name": "Sunrise",
    "description": "Carla's wakeup experience",
    "classid": 1,
    "owner": "78H56B12BAABCDEF",
    "links": ["/schedules/2", "/schedules/3",
              "/scenes/ABCD", "/scenes/EFGH", "/groups/8"]
              }""";
const String allRules = """{
"1": {
    "name": "Wall Switch Rule",
    "lasttriggered": "2013-10-17T01:23:20",
    "creationtime": "2013-10-10T21:11:45",
    "timestriggered": 27,
    "owner": "78H56B12BA",
    "status": "enabled",
    "conditions": [
        {
            "address": "/sensors/2/state/buttonevent",
            "operator": "eq",
            "value": "16"
        },
        {
            "address": "/sensors/2/state/lastupdated",
            "operator": "dx"
        }
    ],
    "actions": [
        {
            "address": "/groups/0/action",
            "method": "PUT",
            "body": {
                "scene": "S3"
            }
        }
    ]
}
}""";
const String singleRule = """{
    "name": "Wall Switch Rule",
    "lasttriggered": "2013-10-17T01:23:20",
    "creationtime": "2013-10-10T21:11:45",
    "timestriggered": 27,
    "owner": "78H56B12BA",
    "status": "enabled",
    "conditions": [
        {
            "address": "/sensors/2/state/buttonevent",
            "operator": "eq",
            "value": "16"
        },
        {
            "address": "/sensors/2/state/lastupdated",
            "operator": "dx"
        }
    ],
    "actions": [
        {
            "address": "/groups/0/action",
            "method": "PUT",
            "body": {
                "scene": "S3"
            }
        }
    ]
}""";
const String allScenes = """{
	"497b50d84-on-0": {
		"name": "Sunset on 0",
		"lights": [
			"1",
			"2",
			"3"
		],
		"owner": "none",
		"recycle": true,
		"locked": false,
		"appdata": {},
		"picture": "",
		"lastupdated": null,
		"version": 1
	},
	"c4a83e4d1-on-0": {
		"name": "Pencils on 0",
		"lights": [
			"1",
			"2",
			"3"
		],
		"owner": "14a930704b59a4547a9cbfe24787daaa",
		"recycle": true,
		"locked": false,
		"appdata": {},
		"picture": "",
		"lastupdated": "2016-07-10T20:10:59",
		"version": 1
	},
	"1437fcf21-on-0": {
		"name": "Pencils on 0",
		"lights": [
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9"
		],
		"owner": "14a930704b59a4547a9cbfe24787daaa",
		"recycle": true,
		"locked": false,
		"appdata": {},
		"picture": "",
		"lastupdated": "2016-07-10T20:11:37",
		"version": 1
	},
	"42YARQOHMNIPia6": {
		"name": "Relax",
		"lights": [
			"15",
			"17"
		],
		"owner": "MUSAY5n2PtInw1x3N0mqHEwt6eOBhQqaEucmqvgc",
		"recycle": false,
		"locked": false,
		"appdata": {
			"version": 1,
			"data": "6iELK_r01_d01"
		},
		"picture": "",
		"lastupdated": "2017-04-30T15:14:42",
		"version": 2
	}	
}""";
const String singleScene = """{
		"name": "Relax",
		"lights": [
			"15",
			"17"
		],
		"owner": "MUSAY5n2PtInw1x3N0mqHEwt6eOBhQqaEucmqvgc",
		"recycle": false,
		"locked": false,
		"appdata": {
			"version": 1,
			"data": "6iELK_r01_d01"
		},
		"picture": "",
		"lastupdated": "2017-04-30T15:14:42",
		"version": 2
	}""";
const String allSchedules = """{
	"41803987474705890": {
		"name": "Absolute Time Alarm",
		"description": "Absolute Time Alarm",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "22227461b-on-0"
			},
			"method": "PUT"
		},
		"localtime": "2018-07-15T05:30:00",
		"time": "2018-07-15T03:30:00",
		"created": "2016-07-10T20:26:36",
		"status": "disabled",
		"recycle": false
	},
	"41803987474705891": {
		"name": "Randomized Time Alarm",
		"description": "Randomized Time Alarm",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "22227461b-on-0"
			},
			"method": "PUT"
		},
		"localtime": "2018-07-15T05:30:00A20:44:53",
		"time": "2018-07-15T03:30:00A20:44:53",
		"created": "2016-07-10T20:26:36",
		"status": "disabled",
		"recycle": false
	},	
	"4180398747470589": {
		"name": "Recurring Alarm",
		"description": "Recurring Alarm",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "22227461b-on-0"
			},
			"method": "PUT"
		},
		"localtime": "W124/T05:30:00",
		"time": "W124/T03:30:00",
		"created": "2016-07-10T20:26:36",
		"status": "disabled",
		"recycle": false
	},
	"7796503114448045": {
		"name": "Recurring random alarm",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "W127/T23:30:00A20:13:00",
		"time": "W127/T21:30:00A20:13:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	},
	"77965031148055": {
		"name": "time interval alarm",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "T03:30:00/T20:13:00",
		"time": "T03:30:00/T20:13:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	},
	"77965031148051": {
		"name": "Expiring timer",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "PT20:13:00",
		"time": "PT18:13:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	},
	"77965031148052": {
		"name": "Expiring Random timer",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "PT20:13:00A02:23:00",
		"time": "PT18:13:00A02:23:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	},
	"1122334455667788": {
		"name": "Recurring timer 1",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "R12/PT20:13:00",
		"time": "R12/PT18:13:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	},
	"1122334455667799": {
		"name": "Recurring timer 2",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "R/PT20:13:00",
		"time": "R/PT18:13:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	},
	"112233440099": {
		"name": "Random recurring timer",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "R12/PT20:13:00A02:30:00",
		"time": "R12/PT18:13:00A02:30:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	}		
}""";
const String singleSchedule = """{
		"name": "Sleep",
		"description": "",
		"command": {
			"address": "/api/14a930704b59a4547a9cbfe24787daaa/groups/0/action",
			"body": {
				"scene": "04f61b745-off-5"
			},
			"method": "PUT"
		},
		"localtime": "W127/T23:30:00",
		"time": "W127/T21:30:00",
		"created": "2016-07-10T20:27:05",
		"status": "disabled",
		"recycle": false
	}""";
const String allSensors = """{
	"1": {
		"state": {
			"daylight": null,
			"lastupdated": "none"
		},
		"config": {
			"on": true,
			"configured": false,
			"sunriseoffset": 30,
			"sunsetoffset": -30
		},
		"name": "Daylight",
		"type": "Daylight",
		"modelid": "PHDL00",
		"manufacturername": "Philips",
		"swversion": "1.0"
	},
	"2": {
		"state": {
			"buttonevent": 17,
			"lastupdated": "2018-07-13T05:42:24"
		},
		"swupdate": {
			"state": "notupdatable",
			"lastinstall": null
		},
		"config": {
			"on": true
		},
		"name": "Hue tap switch 1",
		"type": "ZGPSwitch",
		"modelid": "ZGPSWITCH",
		"manufacturername": "Philips",
		"productname": "Hue tap switch",
		"uniqueid": "00:00:00:00:00:41:e2:b8-f2",
		"capabilities": {
			"certified": true
		}
	},
	"3": {
		"state": {
			"temperature": 2426,
			"lastupdated": "2018-07-13T07:10:03"
		},
		"swupdate": {
			"state": "noupdates",
			"lastinstall": null
		},
		"config": {
			"on": true,
			"battery": 100,
			"reachable": true,
			"alert": "none",
			"ledindication": false,
			"usertest": false,
			"pending": []
		},
		"name": "Hue temperature sensor 1",
		"type": "ZLLTemperature",
		"modelid": "SML001",
		"manufacturername": "Philips",
		"productname": "Hue temperature sensor",
		"swversion": "6.1.0.18912",
		"uniqueid": "22:24:88:01:02:00:d2:ce-02-0402",
		"capabilities": {
			"certified": true
		}
	},
	"4": {
		"state": {
			"presence": false,
			"lastupdated": "2018-07-13T06:43:41"
		},
		"swupdate": {
			"state": "noupdates",
			"lastinstall": null
		},
		"config": {
			"on": true,
			"battery": 100,
			"reachable": true,
			"alert": "none",
			"ledindication": false,
			"usertest": false,
			"sensitivity": 2,
			"sensitivitymax": 2,
			"pending": []
		},
		"name": "Hue motion sensor 1",
		"type": "ZLLPresence",
		"modelid": "SML001",
		"manufacturername": "Philips",
		"productname": "Hue motion sensor",
		"swversion": "6.1.0.18912",
		"uniqueid": "22:24:88:01:02:00:d2:ce-02-0406",
		"capabilities": {
			"certified": true
		}
	}
}""";
const String singleSensor = """{
		"state": {
			"presence": false,
			"lastupdated": "2018-07-13T06:43:41"
		},
		"swupdate": {
			"state": "noupdates",
			"lastinstall": null
		},
		"config": {
			"on": true,
			"battery": 100,
			"reachable": true,
			"alert": "none",
			"ledindication": false,
			"usertest": false,
			"sensitivity": 2,
			"sensitivitymax": 2,
			"pending": []
		},
		"name": "Hue motion sensor 1",
		"type": "ZLLPresence",
		"modelid": "SML001",
		"manufacturername": "Philips",
		"productname": "Hue motion sensor",
		"swversion": "6.1.0.18912",
		"uniqueid": "22:24:88:01:02:00:d2:ce-02-0406",
		"capabilities": {
			"certified": true
		}
	}""";
const String singleSensorModelIdPlaceholder = """{
		"state": {
			"presence": false,
			"lastupdated": "2018-07-13T06:43:41"
		},
		"swupdate": {
			"state": "noupdates",
			"lastinstall": null
		},
		"config": {
			"on": true,
			"battery": 100,
			"reachable": true,
			"alert": "none",
			"ledindication": false,
			"usertest": false,
			"sensitivity": 2,
			"sensitivitymax": 2,
			"pending": []
		},
		"name": "Hue motion sensor 1",
		"type": "ZLLPresence",
		"modelid": "<model_id>",
		"manufacturername": "Philips",
		"productname": "Hue motion sensor",
		"swversion": "6.1.0.18912",
		"uniqueid": "22:24:88:01:02:00:d2:ce-02-0406",
		"capabilities": {
			"certified": true
		}
	}""";
