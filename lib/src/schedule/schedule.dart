import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:hue_dart/src/schedule/command.dart';
import 'package:hue_dart/src/schedule/schedule_type.dart';

part 'schedule.g.dart';

abstract class Schedule
    with BridgeObject
    implements Built<Schedule, ScheduleBuilder> {
  static const String absoluteTimeAlarm = '\\d*-\\d*-\\d*T\\d*:\\d*:\\d*';
  static const String randomizedTimeAlarm =
      '\\d*-\\d*-\\d*T\\d*:\\d*:\\d*A\\d*:\\d*:\\d*';
  static const String recurringAlarm = 'W\\d*/T\\d*:\\d*:\\d*';
  static const String randomRecurringTimeAlarm =
      'W\\d*/T\\d*:\\d*:\\d*A\\d*:\\d*:\\d*';
  static const String timeIntervalAlarm = 'T\\d*:\\d*:\\d*/T\\d*:\\d*:\\d*';
  static const String expiringTimer = 'PT\\d*:\\d*:\\d*';
  static const String randomTimer = 'PT\\d*:\\d*:\\d*A\\d*:\\d*:\\d*';
  static const String recurringTimer1 = 'R\\d*/PT\\d*:\\d*:\\d*';
  static const String recurringTimer2 = 'R/PT\\d*:\\d*:\\d*';
  static const String recurringRandomTimer =
      'R\\d*/PT\\d*:\\d*:\\d*A\\d*:\\d*:\\d*';
  static const String timePattern = 'HH:mm:ss';
  static const String datePattern = 'YYYY-MM-dd';
  static const String timeDivider = 'T';
  static const String randomTimeDivider = 'A';

  String? get id;

  ///Name for the new schedule. If a name is not specified then the default name, “schedule”, is used.
  ///If the name is already taken a space and number will be appended by the bridge, e.g. “schedule 1”.

  String? get name;

  ///Description of the new schedule. If the description is not specified it will be empty.

  String? get description;

  ///Local time when the scheduled event will occur.
  ///
  ///Either time or localtime has to be provided. A schedule configured with localtime will operate on localtime and is returned along with the time attribute (UTC) for backwards compatibility. The following time patterns are allowed:
  ///
  ///Absolute time
  ///Randomized time
  ///Recurring times
  ///Recurring randomized times
  ///Timers
  ///For a full description of the allowed time pattern formats please check the allowed time patterns.
  ///Incorrectly formatted dates will raise an error of type 7. If the time is in the past an error 7 will also be raised.
  @BuiltValueField(wireName: 'localtime')
  String? get time;

  ///'enabled'  Schedule is enabled
  ///'disabled'  Schedule is disabled by user.
  ///Application is only allowed to set “enabled” or “disabled”. Disabled causes a timer to reset when activated (i.e. stop & reset). “enabled” when not provided on creation.

  String? get status;

  ///If set to true, the schedule will be removed automatically if expired, if set to false it will be disabled. Default is true. Only visible for non-recurring schedules.
  @BuiltValueField(wireName: 'autodelete')
  bool? get autoDelete;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resource. “false” when omitted.

  bool? get recycle;

  Command? get command;

  bool get isAlarm => _isAlarm(time!);

  bool get isTimer => _isTimer(time!);

  @memoized
  ScheduleType get type {
    if (isAlarm) {
      return Alarm(this);
    } else {
      return Timer(this);
    }
  }

  static Serializer<Schedule> get serializer => _$scheduleSerializer;

  factory Schedule([Function(ScheduleBuilder b) updates]) = $Schedule;

  Schedule._();

  factory Schedule.fromJson(Map json, {String? id}) {
    return serializers
        .deserializeWith(Schedule.serializer, json)!
        .rebuild((b) => b..id = id);
  }

  static bool _isAlarm(String time) {
    return RegExp(absoluteTimeAlarm).hasMatch(time) ||
        RegExp(randomizedTimeAlarm).hasMatch(time) ||
        RegExp(recurringAlarm).hasMatch(time) ||
        RegExp(randomRecurringTimeAlarm).hasMatch(time) ||
        RegExp(timeIntervalAlarm).hasMatch(time);
  }

  static bool _isTimer(String time) {
    return RegExp(recurringRandomTimer).hasMatch(time) ||
        RegExp(recurringTimer1).hasMatch(time) ||
        RegExp(recurringTimer2).hasMatch(time) ||
        RegExp(randomTimer).hasMatch(time) ||
        RegExp(expiringTimer).hasMatch(time);
  }

  @override
  Map toBridgeObject({String? action}) {
    if ('create' == action) {
      return {
        'name': name,
        'description': description ?? '',
        'localtime': time,
        'command': command!.toBridgeObject(),
        'status': status ?? 'enabled',
        'autodelete': autoDelete ?? true,
        'recycle': recycle ?? false
      };
    } else if ('attributes' == action) {
      final body = {};
      if (name != null) {
        body['name'] = name;
      }
      if (description != null) {
        body['description'] = description;
      }
      if (time != null) {
        body['localtime'] = time;
      }
      if (command != null) {
        body['command'] = command;
      }
      if (status != null) {
        body['status'] = status;
      }
      return body;
    }
    return {};
  }
}
