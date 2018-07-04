import 'dart:async';

import 'package:hue_dart/src/core/bridge_response_handler.dart';
import 'package:hue_dart/src/schedule/schedule.dart';

class ScheduleApi extends Object with BridgeResponseHandler {
  String address;
  String username;

  ScheduleApi(this.address, this.username);

    Future<List<Schedule>> all() async {
      String url = '$address/api/$username/schedules';
      final response = await get(url);
      return _responseToSchedules(response);
    }

    List<Schedule> _responseToSchedules(Map<String, dynamic> response) {
      final schedules = <Schedule>[];
      for (String id in response.keys) {
        Map<String, dynamic> item = response[id];
        final schedule = new Schedule.fromJson(item);
        schedule.id = id;
        schedules.add(schedule);
      }
      return schedules;
    }

    Future<Schedule> single(String id) async {
      String url = '$address/api/$username/schedules/$id';
      final response = await get(url);
      final schedule = new Schedule.fromJson(response);
      schedule.id = id;
      return schedule;
    }

    Future<Schedule> create(Schedule schedule) async {
      String url = '$address/api/$username/schedules';
      final response = await post(url, schedule.toBridgeObject(action: 'create'));
      schedule.id = result(response, key: 'id');
      return schedule;
    }

    Future<Map<String, dynamic>> attributes(Schedule schedule) async {
      String url = '$address/api/$username/schedules/${schedule.id}';
      final response = await put(url, schedule.toBridgeObject(action: 'attributes'));
      return result(response);
    }

    Future<bool> delete(Schedule schedule) async {
      String url = '$address/api/$username/schedules/${schedule.id}';
      return await deleteCall(url);
    }
}
