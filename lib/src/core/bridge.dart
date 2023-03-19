import 'dart:async';

import 'package:http/http.dart';
import 'package:hue_dart/src/configuration/configuration.dart';
import 'package:hue_dart/src/configuration/configuration_api.dart';
import 'package:hue_dart/src/configuration/whitelist_item.dart';
import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/group/group_api.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/light/light_api.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';
import 'package:hue_dart/src/resource_link/resource_link_api.dart';
import 'package:hue_dart/src/rule/rule.dart';
import 'package:hue_dart/src/rule/rule_api.dart';
import 'package:hue_dart/src/scene/scene.dart';
import 'package:hue_dart/src/scene/scene_api.dart';
import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:hue_dart/src/schedule/schedule_api.dart';
import 'package:hue_dart/src/sensor/sensor.dart';
import 'package:hue_dart/src/sensor/sensor_api.dart';

/// a [Bridge] is used as a facade to the different api's
class Bridge {
  final ConfigurationApi _configurationApi;
  final GroupApi _groupApi;
  final LightApi _lightApi;
  final ResourceLinkApi _resourceLinkApi;
  final RuleApi _ruleApi;
  final SceneApi _sceneApi;
  final ScheduleApi _scheduleApi;
  final SensorApi _sensorApi;

  late String _username;

  /// create a bridge with a platform specific [client]. Setting the optional [username] enables the use of calls on the bridge that require a username
  Bridge(Client client, String address, [String username = ''])
      : this._withApi(
          ConfigurationApi(BridgeClient(client, address)),
          GroupApi(BridgeClient(client, address)),
          LightApi(BridgeClient(client, address)),
          ResourceLinkApi(BridgeClient(client, address)),
          RuleApi(BridgeClient(client, address)),
          SceneApi(BridgeClient(client, address)),
          ScheduleApi(BridgeClient(client, address)),
          SensorApi(BridgeClient(client, address)),
          username,
        );

  Bridge._withApi(
    this._configurationApi,
    this._groupApi,
    this._lightApi,
    this._resourceLinkApi,
    this._ruleApi,
    this._sceneApi,
    this._scheduleApi,
    this._sensorApi, [
    String username = '',
  ]) {
    this.username = username;
  }

  /// set a username to enable the use of cclls on the bridge that require a username
  // ignore: avoid_setters_without_getters
  set username(String username) {
    _username = username;
    _groupApi.username = username;
    _lightApi.username = username;
    _resourceLinkApi.username = username;
    _ruleApi.username = username;
    _sceneApi.username = username;
    _scheduleApi.username = username;
    _sensorApi.username = username;
  }

  Future<Configuration> completeConfiguration() async =>
      _configurationApi.completeConfiguration(_username);

  Future<Configuration> configuration() async =>
      _configurationApi.configuration(_username);

  Future<WhiteListItem> createUser({
    HueApiDeviceType deviceType = HueApiDeviceType.device2,
  }) async =>
      _configurationApi.createUser(deviceType: deviceType);

  Future<BridgeResponse> deleteUser(String deletingUsername) async =>
      _configurationApi.deleteUser(_username, deletingUsername);

  /// update the bridge's configuration. Check the docs to see what can be changed
  Future<BridgeResponse> updateConfiguration(
    Configuration configuration,
  ) async =>
      _configurationApi.update(_username, configuration);

  Future<List<Group>> groups() async => _groupApi.all();

  Future<Group> group(int id) async => _groupApi.single(id);

  Future<Group> createGroup(Group group) async => _groupApi.create(group);

  /// change the name, class and/or lights of a [group].
  Future<BridgeResponse> updateGroupAttributes(Group group) async =>
      _groupApi.attributes(group);

  /// update the color state of the lights in the [group]
  Future<BridgeResponse> updateGroupState(Group group) async =>
      _groupApi.state(group);

  Future<BridgeResponse> deleteGroup(Group group) async =>
      _groupApi.delete(group);

  Future<List<Light>> lights() async => _lightApi.all();

  Future<Light> light(int id) async => _lightApi.single(id);

  /// initiate a search for new lights. Optional serial numbers can be sent as [deviceIds].
  Future<BridgeResponse> searchLights([
    List<String> deviceIds = const [],
  ]) async =>
      _lightApi.search(deviceIds);

  /// return the lights found in the last search for new lights
  Future<List<Light>> lightSearchResults() async => _lightApi.searchResults();

  Future<BridgeResponse> renameLight(Light light) async =>
      _lightApi.attributes(light);

  Future<BridgeResponse> updateLightState(Light light) async =>
      _lightApi.state(light);

  Future<BridgeResponse> deleteLight(Light light) async =>
      _lightApi.delete(light);

  Future<List<ResourceLink>> resourceLinks() async => _resourceLinkApi.all();

  Future<ResourceLink> resourceLink(String id) async =>
      _resourceLinkApi.single(id);

  Future<ResourceLink> createResourceLink(ResourceLink resourceLink) async =>
      _resourceLinkApi.create(resourceLink);

  Future<BridgeResponse> updateResourceLink(ResourceLink resourceLink) async =>
      _resourceLinkApi.update(resourceLink);

  Future<BridgeResponse> deleteResourceLink(ResourceLink resourceLink) async =>
      _resourceLinkApi.delete(resourceLink);

  Future<List<Rule>> rules() async => _ruleApi.all();

  Future<Rule> rule(int id) async => _ruleApi.single(id);

  Future<Rule> createRule(Rule rule) async => _ruleApi.create(rule);

  Future<BridgeResponse> updateRule(Rule rule) async => _ruleApi.update(rule);

  Future<BridgeResponse> deleteRule(Rule rule) async => _ruleApi.delete(rule);

  Future<List<Scene>> scenes() async => _sceneApi.all();

  Future<Scene> scene(String id) async => _sceneApi.single(id);

  Future<BridgeResponse> updateSceneAttributes(Scene scene) async =>
      _sceneApi.attributes(scene);

  Future<BridgeResponse> updateSceneLightState(
    Scene scene,
    Light light,
  ) async =>
      _sceneApi.state(scene, light);

  Future<Scene> createScene(Scene scene) async => _sceneApi.create(scene);

  Future<BridgeResponse> deleteScene(Scene scene) async =>
      _sceneApi.delete(scene);

  Future<List<Schedule>> schedules() async => _scheduleApi.all();

  Future<Schedule> schedule(String id) async => _scheduleApi.single(id);

  Future<Schedule> createSchedule(Schedule schedule) async =>
      _scheduleApi.create(schedule);

  Future<BridgeResponse> updateScheduleAttributes(Schedule schedule) async =>
      _scheduleApi.attributes(schedule);

  Future<BridgeResponse> deleteSchedule(Schedule schedule) async =>
      _scheduleApi.delete(schedule);

  Future<List<Sensor>> sensors() async => _sensorApi.all();

  Future<Sensor> sensor(String id) async => _sensorApi.single(id);

  Future<BridgeResponse> searchSensors() async => _sensorApi.search();

  Future<List<Sensor>> sensorSearchResults() async =>
      _sensorApi.searchResults();

  Future<Sensor> createSensor(Sensor sensor) async => _sensorApi.create(sensor);

  Future<BridgeResponse> updateSensorAttributes(Sensor sensor) async =>
      _sensorApi.attributes(sensor);

  Future<BridgeResponse> updateSensorConfig(Sensor sensor) async =>
      _sensorApi.config(sensor);

  Future<BridgeResponse> updateSensorState(Sensor sensor) async =>
      _sensorApi.state(sensor);

  Future<BridgeResponse> deleteSensor(Sensor sensor) async =>
      _sensorApi.delete(sensor);

  /// Waiting for user to click the button on top of the Philips Hue hub.
  /// When it will be clicked it will return the created user id
  Future<String> brideLoopToAwaitPushlinkForUserId({
    HueApiDeviceType deviceType = HueApiDeviceType.device2,
    int delayInSeconds = 15,
  }) async {
    String username;

    while (true) {
      try {
        final whiteListItem = await createUser(deviceType: deviceType);
        final String? usernameTemp = whiteListItem.username;
        if (usernameTemp != null) {
          username = usernameTemp;
          break;
        }
        print('Returned user name is null, this is an error');
      } catch (error) {
        print('Waiting Pushlink to be clicked, pleas click the button on top'
            ' of the Philips Hue Hub');
      }
      await Future.delayed(Duration(seconds: delayInSeconds));
    }

    return username;
  }
}
