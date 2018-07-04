import 'dart:async';

import 'package:hue_dart/src/core/bridge_response_handler.dart';
import 'package:hue_dart/src/light/light.dart';

class LightApi extends Object with BridgeResponseHandler {
  String address;
  String username;

  LightApi(this.address, this.username);

  Future<List<Light>> all() async {
    String url = '$address/api/$username/lights';
    final response = await get(url);
    return _responseToLights(response);
  }

  List<Light> _responseToLights(Map<String, dynamic> response) {
    final lights = <Light>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      final light = new Light.fromJson(item);
      light.id = int.parse(id);
      lights.add(light);
    }
    return lights;
  }

  Future<Light> single(int id) async {
    String url = '$address/api/$username/lights/$id';
    final response = await get(url);

    final light = new Light.fromJson(response);
    light.id = id;
    return light;
  }

  Future<Map<String, dynamic>> search({List<String> deviceIds = const []}) async {
    String url = '$address/api/$username/lights';
    Map<String, dynamic> body = {
      'deviceid' : deviceIds
    };
    final response = await post(url, body);
    return result(response);
  }

  Future<List<Light>> searchResults() async {
    String url = '$address/api/$username/lights/new';
    final response = await get(url);

    final lights = <Light>[];
    for (String id in response.keys) {
      if (id != 'lastscan') {
        lights.add(await single(int.parse(id)));
      }
    }
    return lights;
  }

  Future<Map<String, dynamic>> attributes(Light light) async {
    String url = '$address/api/$username/lights/${light.id}';
    final response = await put(url, light.toBridgeObject(action: 'attributes'));
    return result(response);
  }

  Future<Map<String, dynamic>> state(Light light) async {
    String url = '$address/api/$username/lights/${light.id}/state';
    final response = await put(url, light.toBridgeObject(action: 'state'));
    return result(response);
  }

  Future<bool> delete(Light light) async {
    String url = '$address/api/$username/lights/${light.id}';
    return await deleteCall(url);
  }
}
