import 'dart:async';

import 'package:hue_dart/src/core/bridge_response_handler.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class SensorApi extends Object with BridgeResponseHandler {
  String address;
  String username;

  SensorApi(this.address, this.username);

  Future<List<Sensor>> all() async {
    String url = '$address/api/$username/sensors';
    final response = await get(url);
    return _responseToSensors(response);
  }

  List<Sensor> _responseToSensors(Map<String, dynamic> response) {
    final sensors = <Sensor>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      final sensor = new Sensor.fromJson(item);
      sensor.id = int.parse(id);
      sensors.add(sensor);
    }
    return sensors;
  }

  Future<Sensor> single(String id) async {
    String url = '$address/api/$username/sensors/$id';
    final response = await get(url);
    final sensor = new Sensor.fromJson(response);
    sensor.id = int.parse(id);
    return sensor;
  }

  Future<Sensor> create(Sensor sensor) async {
    String url = '$address/api/$username/scenes';
    final response = await post(url, sensor.toBridgeObject(action: 'create'));
    sensor.id = result(response, 'id');
    return sensor;
  }

  Future<Map<String, dynamic>> search() async {
    String url = '$address/api/$username/sensors';
    final response = await post(url);
    return result(response);
  }

  Future<List<Sensor>> searchResults() async {
    String url = '$address/api/$username/sensors/new';
    final response = await get(url);
    final sensors = <Sensor>[];
    for (String id in response.keys) {
      sensors.add(await single(id));
    }
    return sensors;
  }

  Future<Map<String, dynamic>> attributes(Sensor sensor) async {
    String url = '$address/api/$username/sensors/${sensor.id}';
    final response = await put(url, sensor.toBridgeObject(action: 'attributes'));
    return result(response);
  }

  Future<Map<String, dynamic>> config(Sensor sensor) async {
    String url = '$address/api/$username/sensors/${sensor.id}/config';
    final response = await put(url, sensor.toBridgeObject(action: 'config'));
    return result(response);
  }

  Future<Map<String, dynamic>> state(Sensor sensor) async {
    String url = '$address/api/$username/sensors/${sensor.id}/state';
    final response = await put(url, sensor.toBridgeObject(action: 'state'));
    return result(response);
  }

  Future<void> delete(Sensor sensor) async {
    String url = '$address/api/$username/sensors/${sensor.id}';
    return await deleteCall(url);
  }

}
