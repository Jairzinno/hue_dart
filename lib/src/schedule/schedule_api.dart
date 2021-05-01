import 'dart:async' hide Timer;

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/schedule/schedule.dart';

class ScheduleApi {
  final BridgeClient _client;
  late String _username;

  ScheduleApi(this._client, [this._username = '']);

  // ignore: avoid_setters_without_getters
  set username(String username) => _username = username;

  Future<List<Schedule>> all() async {
    final url = '/api/$_username/schedules';
    final response = await _client.get(url);
    return _responseToSchedules(response);
  }

  List<Schedule> _responseToSchedules(Map<String, dynamic> response) {
    final schedules = <Schedule>[];
    for (final id in response.keys) {
      final item = response[id] as Map<String, dynamic>;
      final schedule = Schedule.fromJson(item, id: id);
      schedules.add(schedule);
    }
    return schedules;
  }

  Future<Schedule> single(String id) async {
    final url = '/api/$_username/schedules/$id';
    final response = await _client.get(url);
    final schedule = Schedule.fromJson(response, id: id);
    return schedule;
  }

  Future<Schedule> create(Schedule schedule) async {
    final url = '/api/$_username/schedules';
    final response = await _client.post(
        url, schedule.toBridgeObject(action: 'create'), 'id');
    return schedule.rebuild((b) => b..id = response.key as String?);
  }

  Future<BridgeResponse> attributes(Schedule schedule) async {
    final url = '/api/$_username/schedules/${schedule.id}';
    return _client.put(url, schedule.toBridgeObject(action: 'attributes'));
  }

  Future<BridgeResponse> delete(Schedule schedule) async {
    final url = '/api/$_username/schedules/${schedule.id}';
    return _client.delete(url);
  }
}
