import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/light/light.dart';

class GroupApi {
  final BridgeClient _client;
  String _username;

  GroupApi(this._client, [this._username]);

  void set username(String username) => this._username = username;

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
      var group = new Group.fromJson(item);
      group.id = int.parse(key);
      groups.add(group);
    }
    for (Group group in groups) {
      group.lights = await _lights(group.lights);
    }
    return groups;
  }

  Future<List<Light>> _lights(List<Light> lights) async {
    var result = <Light>[];
    for (Light _light in lights) {
      result.add(await _completeLight(_light.id));
    }
    ;
    return result;
  }

  Future<Light> _completeLight(int id) async {
    String url = '/api/$_username/lights/$id';
    final response = await _client.get(url);
    var light = new Light.fromJson(response);
    light.id = id;
    return light;
  }

  /// Gets a list of all groups that have been added to the bridge
  Future<Group> single(int id) async {
    String url = '/api/$_username/groups/$id';
    final response = await _client.get(url);
    var group = new Group.fromJson(response);
    group.id = id;
    group.lights = await _lights(group.lights);
    return group;
  }

  Future<Group> create(Group group) async {
    String url = '/api/$_username/groups';
    final response =
        await _client.post(url, group.toBridgeObject(action: 'create'), 'id');
    group.id = int.parse(response.key);
    return group;
  }

  Future<BridgeResponse> attributes(Group group) async {
    String url = '/api/$_username/groups/${group.id}';
    return await _client.put(url, group.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> state(Group group) async {
    String url = '/api/$_username/groups/${group.id}/action';
    return await _client.put(url, group.action.toBridgeObject());
  }

  Future<BridgeResponse> delete(Group group) async {
    String url = '/api/$_username/groups/${group.id}';
    return await _client.delete(url);
  }
}
