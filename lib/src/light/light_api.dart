import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/light/light.dart';

class LightApi {
  BridgeClient _client;
  String _username;

  LightApi(this._client, [this._username]);

  void set username(String username) => this._username = username;

  Future<List<Light>> all() async {
    String url = '/api/$_username/lights';
    final response = await _client.get(url);
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
    String url = '/api/$_username/lights/$id';
    final response = await _client.get(url);

    final light = new Light.fromJson(response);
    light.id = id;
    return light;
  }

  Future<BridgeResponse> search([List<String> deviceIds = const []]) async {
    String url = '/api/$_username/lights';
    if (deviceIds.isEmpty) {
      return await _client.post(url);
    } else {
      Map<String, dynamic> body = {
        'deviceid' : deviceIds
      };
      return await _client.post(url, body);
    }

  }

  Future<List<Light>> searchResults() async {
    String url = '/api/$_username/lights/new';
    final response = await _client.get(url);

    final lights = <Light>[];
    for (String id in response.keys) {
      if (id != 'lastscan') {
        lights.add(await single(int.parse(id)));
      }
    }
    return lights;
  }

  Future<BridgeResponse> attributes(Light light) async {
    String url = '/api/$_username/lights/${light.id}';
    return await _client.put(url, light.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> state(Light light) async {
    String url = '/api/$_username/lights/${light.id}/state';
    return await _client.put(url, light.toBridgeObject(action: 'state'));
  }

  Future<BridgeResponse> delete(Light light) async {
    String url = '/api/$_username/lights/${light.id}';
    return await _client.delete(url);
  }
}
