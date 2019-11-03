import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/scene/scene.dart';

class SceneApi {
  BridgeClient _client;
  String _username;

  SceneApi(this._client, [this._username]);

  set username(String username) => this._username = username;
  set address(String address) => this.address = address;

  Future<List<Scene>> all() async {
    String url = '/api/$_username/scenes';
    final response = await _client.get(url);
    return await _responseToScenes(response);
  }

  Future<List<Scene>> _responseToScenes(Map<String, dynamic> response) async {
    final scenes = <Scene>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      final scene = Scene.fromJson(item, id: id);
      final lights = await _lights(scene);
      scene.rebuild((b) => b..sceneLights.replace(lights));
      scenes.add(scene);
    }
    return scenes;
  }

  Future<List<Light>> _lights(Scene scene) async {
    final result = <Light>[];
    for (String _id in scene.lightIds) {
      result.add(await _completeLight(int.parse(_id)));
    }
    return result;
  }

  Future<Light> _completeLight(int id) async {
    String url = '/api/$_username/lights/$id';
    final response = await _client.get(url);
    return Light.fromJson(response, id: id);
  }

  Future<Scene> single(String id) async {
    String url = '/api/$_username/scenes/$id';
    final response = await _client.get(url);
    final scene = Scene.fromJson(response, id: id);
    final lights = await _lights(scene);
    scene.rebuild((b) => b..sceneLights.replace(lights));
    return scene;
  }

  Future<Scene> create(Scene scene) async {
    String url = '/api/$_username/scenes';
    final response =
        await _client.post(url, scene.toBridgeObject(action: 'create'), 'id');
    return scene.rebuild((b) => b..id = response.key);
  }

  Future<BridgeResponse> attributes(Scene scene) async {
    String url = '/api/$_username/scenes/${scene.id}';
    return await _client.put(url, scene.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> state(Scene scene, Light light) async {
    String url = '/api/$_username/scenes/${scene.id}/lightstates/${light.id}';
    return await _client.put(url, light.toBridgeObject(action: 'state'));
  }

  Future<BridgeResponse> delete(Scene scene) async {
    String url = '/api/$_username/scenes/${scene.id}';
    return await _client.delete(url);
  }
}
