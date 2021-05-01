import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class SensorApi {
  final BridgeClient _client;
  late String _username;

  SensorApi(this._client, [this._username = '']);

  // ignore: avoid_setters_without_getters
  set username(String username) => _username = username;

  Future<List<Sensor>> all() async {
    final url = '/api/$_username/sensors';
    final response = await _client.get(url);
    return _responseToSensors(response);
  }

  List<Sensor> _responseToSensors(Map<String, dynamic> response) {
    final sensors = <Sensor>[];
    for (final id in response.keys) {
      final item = response[id] as Map<String, dynamic>;
      final sensor = Sensor.fromJson(item, id: int.parse(id));
      sensors.add(sensor);
    }
    return sensors;
  }

  Future<Sensor> single(String id) async {
    final url = '/api/$_username/sensors/$id';
    final response = await _client.get(url);
    final sensor = Sensor.fromJson(response, id: int.parse(id));
    return sensor;
  }

  Future<Sensor> create(Sensor sensor) async {
    final url = '/api/$_username/sensors';
    final response =
        await _client.post(url, sensor.toBridgeObject(action: 'create'), 'id');
    return sensor.rebuild((b) => b..id = int.tryParse(response.key as String));
  }

  Future<BridgeResponse> search() async {
    final url = '/api/$_username/sensors';
    return _client.post(url);
  }

  Future<List<Sensor>> searchResults() async {
    final url = '/api/$_username/sensors/new';
    final response = await _client.get(url);
    final sensors = <Sensor>[];
    for (final id in response.keys) {
      if (int.tryParse(id) != null) {
        sensors.add(await single(id));
      }
    }
    return sensors;
  }

  Future<BridgeResponse> attributes(Sensor sensor) async {
    final url = '/api/$_username/sensors/${sensor.id}';
    return _client.put(url, sensor.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> config(Sensor sensor) async {
    final url = '/api/$_username/sensors/${sensor.id}/config';
    return _client.put(url, sensor.toBridgeObject(action: 'config'));
  }

  Future<BridgeResponse> state(Sensor sensor) async {
    final url = '/api/$_username/sensors/${sensor.id}/state';
    return _client.put(url, sensor.toBridgeObject(action: 'state'));
  }

  Future<BridgeResponse> delete(Sensor sensor) async {
    final url = '/api/$_username/sensors/${sensor.id}';
    return _client.delete(url);
  }
}
