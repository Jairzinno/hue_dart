import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class SensorApi {
  BridgeClient _client;
  String _username;

  SensorApi(this._client, [this._username]);

  void set username(String username) => this._username = username;

  Future<List<Sensor>> all() async {
    String url = '/api/$_username/sensors';
    final response = await _client.get(url);
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
    String url = '/api/$_username/sensors/$id';
    final response = await _client.get(url);
    final sensor = new Sensor.fromJson(response);
    sensor.id = int.parse(id);
    return sensor;
  }

  Future<Sensor> create(Sensor sensor) async {
    String url = '/api/$_username/sensors';
    final response =
    await _client.post(url, sensor.toBridgeObject(action: 'create'), 'id');
    sensor.id = int.parse(response.key);
    return sensor;
  }

  Future<BridgeResponse> search() async {
    String url = '/api/$_username/sensors';
    return await _client.post(url);
  }

  Future<List<Sensor>> searchResults() async {
    String url = '/api/$_username/sensors/new';
    final response = await _client.get(url);
    final sensors = <Sensor>[];
    for (String id in response.keys) {
      if ('lastscan' != id) {
        sensors.add(await single(id));
      }
    }
    return sensors;
  }

  Future<BridgeResponse> attributes(Sensor sensor) async {
    String url = '/api/$_username/sensors/${sensor.id}';
    return await _client.put(url, sensor.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> config(Sensor sensor) async {
    String url = '/api/$_username/sensors/${sensor.id}/config';
    return await _client.put(url, sensor.toBridgeObject(action: 'config'));
  }

  Future<BridgeResponse> state(Sensor sensor) async {
    String url = '/api/$_username/sensors/${sensor.id}/state';
    return await _client.put(url, sensor.toBridgeObject(action: 'state'));
  }

  Future<BridgeResponse> delete(Sensor sensor) async {
    String url = '/api/$_username/sensors/${sensor.id}';
    return await _client.delete(url);
  }
}
