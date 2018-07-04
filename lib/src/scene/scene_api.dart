import 'dart:async';

import 'package:hue_dart/src/core/bridge_response_handler.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/scene/scene.dart';

class SceneApi extends Object with BridgeResponseHandler {
  String address;
  String username;

  SceneApi(this.address, this.username);

  Future<List<Scene>> all() async {
    String url = '$address/api/$username/scenes';
    final response = await get(url);
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

  Future<Scene> single(String id) async {
    String url = '$address/api/$username/scenes/$id';
    final response = await get(url);
    var scene = new Scene.fromJson(response);
    scene.id = id;
    scene.lights = await _lights(scene.lights);
    return scene;
  }

  Future<Scene> create(Scene scene) async {
    String url = '$address/api/$username/scenes';
    final response = await post(url, scene.toBridgeObject(action: 'create'));
    scene.id = result(response, key: 'id');
    return scene;
  }

  Future<Map<String, dynamic>> attributes(Scene scene) async {
    String url = '$address/api/$username/scenes/${scene.id}';
    final response = await put(url, scene.toBridgeObject(action: 'attributes'));
    return result(response);
  }

  Future<Map<String, dynamic>> state(Scene scene, Light light) async {
    String url = '$address/api/$username/scenes/${scene.id}/lightstates/${light.id}';
    final response = await put(url, light.toBridgeObject(action: 'state'));
    return result(response);
  }

  Future<void> delete(Scene scene) async {
    String url = '$address/api/$username/scenes/${scene.id}';
    return await deleteCall(url);
  }
}
