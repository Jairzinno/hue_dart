import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/scene/scene.dart';

class SceneApi {
  BridgeClient _client;
  String _username;

  SceneApi(this._client, [this._username]);

  void set username(String username) => this._username = username;
  void set address(String address) => this.address = address;

  Future<List<Scene>> all() async {
    String url = '/api/$_username/scenes';
    final response = await _client.get(url);
    return await _responseToScenes(response);
  }

  Future<List<Scene>> _responseToScenes(Map<String, dynamic> response) async {
    final scenes = <Scene>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      var scene = new Scene.fromJson(item);
      scene.id = id;
      scenes.add(scene);
    }
    for (Scene scene in scenes) {
      scene.lights = await _lights(scene.lights);
    }
    return scenes;
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

  Future<Scene> single(String id) async {
    String url = '/api/$_username/scenes/$id';
    final response = await _client.get(url);
    var scene = new Scene.fromJson(response);
    scene.id = id;
    scene.lights = await _lights(scene.lights);
    return scene;
  }

  Future<Scene> create(Scene scene) async {
    String url = '/api/$_username/scenes';
    final response =
        await _client.post(url, scene.toBridgeObject(action: 'create'), 'id');
    scene.id = response.key;
    return scene;
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
