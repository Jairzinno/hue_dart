import 'dart:async';

import 'package:hue_dart/src/core/bridge_response_handler.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/light/light.dart';

class GroupApi extends Object with BridgeResponseHandler {
  String address;
  String username;

  GroupApi(this.address, this.username);

  /// Gets a list of all groups that have been added to the bridge
  Future<List<Group>> all() async {
    String url = '$address/api/$username/groups';
    final response = await get(url);
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
    };
    return result;
  }

  Future<Light> _completeLight(int id) async {
    String url = '$address/api/$username/lights/$id';
    final response = await get(url);
    var light = new Light.fromJson(response);
    light.id = id;
    return light;
  }

  /// Gets a list of all groups that have been added to the bridge
  Future<Group> single(int id) async {
    String url = '$address/api/$username/groups/$id';
    final response = await get(url);
    var group = new Group.fromJson(response);
    group.id = id;
    group.lights = await _lights(group.lights);
    return group;
  }

  Future<String> create(Group group) async {
    String url = '$address/api/$username/groups';
    final response = await post(url, group.toBridgeObject(action: 'create'));
    return result(response, 'id');
  }

  Future<Map<String, dynamic>> attributes(Group group) async {
    String url = '$address/api/$username/groups/${group.id}';
    final response = await put(url, group.toBridgeObject(action: 'attributes'));
    return result(response);
  }

  Future<Map<String, dynamic>> state(Group group) async {
    String url = '$address/api/$username/groups/${group.id}/action';
    final response = await put(url, group.action.toBridgeObject());
    return result(response);
  }

  Future<Map<String, dynamic>> delete(Group group) async {
    String url = '$address/api/$username/groups/${group.id}';
    final response = await deleteCall(url);
    return result(response);
  }

}
