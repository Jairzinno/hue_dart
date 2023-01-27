import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/scene/scene.dart';

class SceneApi {
  final BridgeClient _client;
  late String _username;

  SceneApi(this._client, [this._username = '']);

  set username(String username) => _username = username;
  set address(String address) => this.address = address;

  Future<List<Scene>> all() async {
    final url = '/api/$_username/scenes';
    final response = await _client.get(url);
    return _responseToScenes(response);
  }

  Future<List<Scene>> _responseToScenes(Map<String, dynamic> response) async {
    final scenes = <Scene>[];
    for (final id in response.keys) {
      final item = response[id] as Map<String, dynamic>;
      final scene = Scene.fromJson(item, id: id);
      final lights = await _lights(scene);
      scene.rebuild((b) => b..sceneLights.replace(lights));
      scenes.add(scene);
    }
    return scenes;
  }

  Future<List<Light>> _lights(Scene scene) async {
    final result = <Light>[];
    for (final id in scene.lightIds!) {
      result.add(await _completeLight(int.parse(id)));
    }
    return result;
  }

  Future<Light> _completeLight(int id) async {
    final url = '/api/$_username/lights/$id';
    final response = await _client.get(url);
    return Light.fromJson(response, id: id);
  }

  Future<Scene> single(String id) async {
    final url = '/api/$_username/scenes/$id';
    final response = await _client.get(url);
    final scene = Scene.fromJson(response, id: id);
    final lights = await _lights(scene);
    scene.rebuild((b) => b..sceneLights.replace(lights));
    return scene;
  }

  Future<Scene> create(Scene scene) async {
    final url = '/api/$_username/scenes';
    final response =
        await _client.post(url, scene.toBridgeObject(action: 'create'), 'id');
    return scene.rebuild((b) => b..id = response.key as String?);
  }

  Future<BridgeResponse> attributes(Scene scene) async {
    final url = '/api/$_username/scenes/${scene.id}';
    return _client.put(url, scene.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> state(Scene scene, Light light) async {
    final url = '/api/$_username/scenes/${scene.id}/lightstates/${light.id}';
    return _client.put(url, light.toBridgeObject(action: 'state'));
  }

  Future<BridgeResponse> delete(Scene scene) async {
    final url = '/api/$_username/scenes/${scene.id}';
    return _client.delete(url);
  }
}
// ignore_for_file: avoid_setters_without_getters
