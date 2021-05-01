import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/light/light.dart';

class LightApi {
  final BridgeClient _client;
  late String _username;

  LightApi(this._client, [this._username = '']);

  // ignore: avoid_setters_without_getters
  set username(String username) => _username = username;

  Future<List<Light>> all() async {
    final url = '/api/$_username/lights';
    final response = await _client.get(url);
    return _responseToLights(response);
  }

  List<Light> _responseToLights(Map<String, dynamic> response) {
    final lights = <Light>[];
    for (final id in response.keys) {
      final item = response[id] as Map<String, dynamic>;
      final light = Light.fromJson(item, id: int.parse(id));
      lights.add(light);
    }
    return lights;
  }

  Future<Light> single(int id) async {
    final url = '/api/$_username/lights/$id';
    final response = await _client.get(url);

    final light = Light.fromJson(response, id: id);
    return light;
  }

  Future<BridgeResponse> search([List<String> deviceIds = const []]) async {
    final url = '/api/$_username/lights';
    if (deviceIds.isEmpty) {
      return _client.post(url);
    } else {
      final body = {'deviceid': deviceIds};
      return _client.post(url, body);
    }
  }

  Future<List<Light>> searchResults() async {
    final url = '/api/$_username/lights/new';
    final response = await _client.get(url);

    final lights = <Light>[];
    for (final id in response.keys) {
      if (int.tryParse(id) != null) {
        lights.add(await single(int.parse(id)));
      }
    }
    return lights;
  }

  Future<BridgeResponse> attributes(Light light) async {
    final url = '/api/$_username/lights/${light.id}';
    return _client.put(url, light.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> state(Light light) async {
    final url = '/api/$_username/lights/${light.id}/state';
    return _client.put(url, light.toBridgeObject(action: 'state'));
  }

  Future<BridgeResponse> delete(Light light) async {
    final url = '/api/$_username/lights/${light.id}';
    return _client.delete(url);
  }
}
