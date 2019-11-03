import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:intl/intl.dart';

abstract class ScheduleType {
  DateTime get date;

  /// value for randomized alarms
  DateTime get randomTime;
}

class Alarm extends ScheduleType {
  _MutableAlarm _alarm;

  /// days on which the alarm applies in a bitmask; 0MTWTFSS. Weekdays is 01111100 = 124. Tuesdays is 00100000 = 32
  int get weekDays => _alarm.weekDays;

  /// end date/time for time interval alarms
  DateTime get endDate => _alarm.endDate;

  @override
  DateTime get date => _alarm.date;

  @override
  DateTime get randomTime => _alarm.randomTime;

  Alarm(Schedule schedule) {
    _alarm = _parseAlarm(schedule.time);
  }

  static _MutableAlarm _parseAlarm(String time) {
    if (RegExp(Schedule.randomRecurringTimeAlarm).hasMatch(time)) {
      return _parseRandomRecurringTimeAlarm(time);
    } else if (RegExp(Schedule.recurringAlarm).hasMatch(time)) {
      return _parseRecurringAlarm(time);
    } else if (RegExp(Schedule.randomizedTimeAlarm).hasMatch(time)) {
      return _parseRandomizedTimeAlarm(time);
    } else if (RegExp(Schedule.absoluteTimeAlarm).hasMatch(time)) {
      return _parseAbsoluteTimeAlarm(time);
    } else if (RegExp(Schedule.timeIntervalAlarm).hasMatch(time)) {
      return _parseTimeIntervalAlarm(time);
    }
    return null;
  }

  static _MutableAlarm _parseRandomRecurringTimeAlarm(String time) {
    String dateValue =
        time.substring(0, time.indexOf(Schedule.randomTimeDivider));
    String randomValue = time.substring(
        time.indexOf(Schedule.randomTimeDivider) + 1, time.length);
    int weekDays = int.parse(time.substring(1, time.indexOf("/")));
    return _MutableAlarm(
        weekDays: weekDays,
        date: DateFormat("W${weekDays}'/T'HH:m:s").parse(dateValue),
        randomTime: DateFormat("HH:m:s").parse(randomValue));
  }

  static _MutableAlarm _parseRecurringAlarm(String time) {
    int weekDays = int.parse(time.substring(1, time.indexOf("/")));
    return _MutableAlarm(
        weekDays: weekDays,
        date: DateFormat("W${weekDays}'/T'HH:m:s").parse(time));
  }

  static _MutableAlarm _parseRandomizedTimeAlarm(String time) {
    String dateValue =
        time.substring(0, time.indexOf(Schedule.randomTimeDivider));
    String randomValue = time.substring(
        time.indexOf(Schedule.randomTimeDivider) + 1, time.length);
    return _MutableAlarm(
        date: DateFormat("yyyy-MM-dd'T'HH:m:s").parse(dateValue),
        randomTime: DateFormat("HH:m:s").parse(randomValue));
  }

  static _MutableAlarm _parseAbsoluteTimeAlarm(String time) {
    return _MutableAlarm(date: DateFormat("yyyy-MM-dd'T'HH:m:s").parse(time));
  }

  static _MutableAlarm _parseTimeIntervalAlarm(String time) {
    String startTime = time.substring(0, time.indexOf('/T'));
    String endTime = time.substring(time.indexOf('/T'));
    return _MutableAlarm(
        date: DateFormat("'T'HH:m:s").parse(startTime),
        endDate: DateFormat("'/T'HH:m:s").parse(endTime));
  }

  String formattedTime() {
    if (isRecurringAlarm()) {
      return _recurringTimeFormat();
    } else {
      return _defaultTimeFormat();
    }
  }

  bool isRecurringAlarm() {
    return weekDays > 0;
  }

  String _recurringTimeFormat() {
    String formattedTime =
        DateFormat(Schedule.timePattern).format(DateTime.now());
    return "W${weekDays}/T${formattedTime}";
  }

  String _defaultTimeFormat() {
    String formattedDate =
        DateFormat(Schedule.datePattern).format(DateTime.now());
    String formattedTime =
        DateFormat(Schedule.timePattern).format(DateTime.now());
    return '${formattedDate}${Schedule.timeDivider}${formattedTime}';
  }
}

class _MutableAlarm {
  DateTime date;

  DateTime randomTime;

  int weekDays;

  DateTime endDate;

  _MutableAlarm({this.date, this.randomTime, this.weekDays, this.endDate});
}

class Timer extends ScheduleType {
  _MutableTimer _timer;

  int get recurrence => _timer.recurrence;

  @override
  DateTime get date => _timer.date;

  @override
  DateTime get randomTime => _timer.randomTime;

  Timer(Schedule schedule) {
    _timer = _parseTimer(schedule.time);
  }

  static _MutableTimer _parseTimer(String time) {
    if (RegExp(Schedule.recurringRandomTimer).hasMatch(time)) {
      return _parseRecurringRandomTimer(time);
    } else if (RegExp(Schedule.recurringTimer1).hasMatch(time)) {
      return _parseFirstTypeOfRecurringTimer(time);
    } else if (RegExp(Schedule.recurringTimer2).hasMatch(time)) {
      return _parseSecondTypeOfRecurringTimer(time);
    } else if (RegExp(Schedule.randomTimer).hasMatch(time)) {
      return _parseRandomTimer(time);
    } else if (RegExp(Schedule.expiringTimer).hasMatch(time)) {
      return _parseExpiringTimer(time);
    }
    return null;
  }

  static _MutableTimer _parseExpiringTimer(String time) {
    String timeValue = time.substring(2, time.length);
    return _MutableTimer(
        date: DateFormat(Schedule.timePattern).parse(timeValue));
  }

  static _MutableTimer _parseRandomTimer(String time) {
    String dateValue =
        time.substring(0, time.indexOf(Schedule.randomTimeDivider));
    String randomValue =
        time.substring(time.indexOf(Schedule.randomTimeDivider));
    return _MutableTimer(
        date: DateFormat("'PT'HH:m:s").parse(dateValue),
        randomTime: DateFormat("'A'HH:m:s").parse(randomValue));
  }

  static _MutableTimer _parseFirstTypeOfRecurringTimer(String time) {
    int recurrence = 0;
    String repeatedValue = time.substring(1, time.indexOf("/"));
    if (repeatedValue.isNotEmpty) {
      recurrence = int.parse(repeatedValue);
    }
    String timeValue =
        time.substring(time.indexOf(Schedule.timeDivider) + 1, time.length);
    return _MutableTimer(
        recurrence: recurrence,
        date: DateFormat(Schedule.timePattern).parse(timeValue));
  }

  static _MutableTimer _parseSecondTypeOfRecurringTimer(String time) {
    String timeValue = time.substring(4, time.length);
    return _MutableTimer(
        date: DateFormat(Schedule.timePattern).parse(timeValue));
  }

  static _MutableTimer _parseRecurringRandomTimer(String time) {
    int recurrence = int.parse(time.substring(1, time.indexOf("/")));
    String timeValue = time.substring(time.indexOf(Schedule.timeDivider) + 1,
        time.indexOf(Schedule.randomTimeDivider));
    String randomValue = time.substring(
        time.indexOf(Schedule.randomTimeDivider) + 1, time.length);
    return _MutableTimer(
        recurrence: recurrence,
        date: DateFormat(Schedule.timePattern).parse(timeValue),
        randomTime: DateFormat(Schedule.timePattern).parse(randomValue));
  }

  String getFormattedTime() {
    if (isRepeated()) {
      return _repeatedFormattedTime();
    } else {
      return _defaultFormattedTime();
    }
  }

  bool isRepeated() {
    return recurrence > 0;
  }

  String _repeatedFormattedTime() {
    String formattedTime =
        DateFormat(Schedule.timePattern).format(DateTime.now());
    return "R${recurrence}/PT${formattedTime}";
  }

  String _defaultFormattedTime() {
    String formattedTime =
        DateFormat(Schedule.timePattern).format(DateTime.now());
    return "PT$formattedTime";
  }
}

class _MutableTimer {
  DateTime date;

  DateTime randomTime;

  int recurrence;

  _MutableTimer({this.date, this.randomTime, this.recurrence});
}
