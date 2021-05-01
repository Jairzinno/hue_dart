import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/light/light.dart';

class GroupApi {
  final BridgeClient _client;
  late String _username;

  GroupApi(this._client, [this._username = '']);

  set username(String username) => this._username = username;

  /// Gets a list of all groups that have been added to the bridge
  Future<List<Group>> all() async {
    String url = '/api/$_username/groups';
    final response = await _client.get(url);
    return await _responseToGroups(response);
  }

  Future<List<Group>> _responseToGroups(Map<String, dynamic> response) async {
    final groups = <Group>[];
    for (String key in response.keys) {
      Map<String, dynamic> item = response[key];
      final group = Group.fromJson(item, id: int.parse(key));
      final lights = await _lights(group);
      groups.add(group.rebuild((b) => b..groupLights.replace(lights)));
    }
    return groups;
  }

  Future<List<Light>> _lights(Group group) async {
    var result = <Light>[];
    for (String _light in group.lightIds!) {
      result.add(await _completeLight(int.parse(_light)));
    }
    return result;
  }

  Future<Light> _completeLight(int id) async {
    String url = '/api/$_username/lights/$id';
    final response = await _client.get(url);
    var light = Light.fromJson(response, id: id);
    return light;
  }

  /// Gets a list of all groups that have been added to the bridge
  Future<Group> single(int id) async {
    String url = '/api/$_username/groups/$id';
    final response = await _client.get(url);
    final group = Group.fromJson(response, id: id);
    final lights = await _lights(group);
    return group.rebuild((b) => b..groupLights.replace(lights));
  }

  Future<Group> create(Group group) async {
    String url = '/api/$_username/groups';
    final response =
        await _client.post(url, group.toBridgeObject(action: 'create'), 'id');
    return group.rebuild((b) => b..id = int.parse(response.key));
  }

  Future<BridgeResponse> attributes(Group group) async {
    String url = '/api/$_username/groups/${group.id}';
    return await _client.put(url, group.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> state(Group group) async {
    String url = '/api/$_username/groups/${group.id}/action';
    return await _client.put(url, group.action!.toBridgeObject());
  }

  Future<BridgeResponse> delete(Group group) async {
    String url = '/api/$_username/groups/${group.id}';
    return await _client.delete(url);
  }
}
