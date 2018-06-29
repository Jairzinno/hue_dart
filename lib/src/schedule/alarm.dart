import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:intl/intl.dart';

class Alarm extends Schedule {
  static const String _ABSOLUTE_TIME_ALARM = "\\d*-\\d*-\\d*T\\d*:\\d*:\\d*";
  static const String _RANDOMIZED_TIME_ALARM = "\\d*-\\d*-\\d*T\\d*:\\d*:\\d*A\\d*:\\d*:\\d*";
  static const String _RECURRING_ALARM = "W\\d*/T\\d*:\\d*:\\d*";
  static const String _RANDOM_RECURRING_TIME_ALARM = "W\\d*/T\\d*:\\d*:\\d*A\\d*:\\d*:\\d*";
  static const String _TIME_PATTERN = "HH:mm:ss";
  static const String _DATE_PATTERN = "YYYY-MM-dd";
  static const String _TIME_DIVIDER = "T";
  static const String _RANDOM_TIME_DIVIDER = "A";

  int recurrence;


  Alarm() {
    _parseAlarm();
  }

  static bool isAlarm(String time) {
    return RegExp(_ABSOLUTE_TIME_ALARM).hasMatch(time) ||
        RegExp(_RANDOMIZED_TIME_ALARM).hasMatch(time) ||
        RegExp(_RECURRING_ALARM).hasMatch(time) ||
        RegExp(_RANDOM_RECURRING_TIME_ALARM).hasMatch(time);
  }

  String getFormattedTime() {
    if (isRecurringAlarm()) {
      return getRecurringTimeFormat();
    } else {
      return getDefaultTimeFormat();
    }
  }

  bool isRecurringAlarm() {
    return getRecurrence() > 0;
  }

  String getRecurringTimeFormat() {
    String formattedTime = DateFormat(_TIME_PATTERN).format(DateTime.now());
    return "W${getRecurrence()}/T${formattedTime}";
  }

  String getDefaultTimeFormat() {
    String formattedDate = DateFormat(_DATE_PATTERN).format(DateTime.now());
    String formattedTime = DateFormat(_TIME_PATTERN).format(DateTime.now());
    return '${formattedDate}${_TIME_DIVIDER}${formattedTime}';
  }

  int getRecurrence() {
    return recurrence;
  }

  void setRecurrence(int recurrence) {
    this.recurrence = recurrence;
  }

  void _parseAlarm() {
    if (RegExp(_ABSOLUTE_TIME_ALARM).hasMatch(time)) {
      _parseAbsoluteTimeAlarm();
    }
    if (RegExp(_RANDOMIZED_TIME_ALARM).hasMatch(time)) {
      _parseRandomizedTimeAlarm();
    }
    if (RegExp(_RECURRING_ALARM).hasMatch(time)) {
      _parseRecurringAlarm();
    }
    if (RegExp(_RANDOM_RECURRING_TIME_ALARM).hasMatch(time)) {
      _parseRandomRecurringTimeAlarm();
    }
  }

  void _parseAbsoluteTimeAlarm() {
    String dateValue = time.substring(0, time.indexOf(_TIME_DIVIDER));
    String timeValue = time.substring(time.indexOf(_TIME_DIVIDER) + 1, time.length);
    DateTime parsedDate = DateTime.parse(dateValue);
    DateTime parsedTime = DateTime.parse(timeValue);
    date = DateTime.fromMillisecondsSinceEpoch(parsedDate.millisecondsSinceEpoch + parsedTime.millisecondsSinceEpoch);
  }

  void _parseRandomizedTimeAlarm() {
    String dateValue = time.substring(0, time.indexOf(_TIME_DIVIDER));
    String timeValue = time.substring(time.indexOf(_TIME_DIVIDER) + 1, time.indexOf(_RANDOM_TIME_DIVIDER));
    String randomValue = time.substring(time.indexOf(_RANDOM_TIME_DIVIDER) + 1, time.length);
    DateTime parsedDate = DateTime.parse(dateValue);
    DateTime parsedTime = DateTime.parse(timeValue);
    DateTime parsedRandomTime = DateTime.parse(randomValue);
    date = DateTime.fromMillisecondsSinceEpoch(parsedDate.millisecondsSinceEpoch + parsedTime.millisecondsSinceEpoch + parsedRandomTime.millisecondsSinceEpoch);
  }

  void _parseRecurringAlarm() {
    this.recurrence = int.parse(time.substring(1, time.indexOf("/")));
    String timeValue = time.substring(time.indexOf(_TIME_DIVIDER) + 1, time.length);
    date = DateTime.parse(timeValue);
  }

  void _parseRandomRecurringTimeAlarm() {
    this.recurrence = int.parse(time.substring(1, time.indexOf("/")));
    String timeValue = time.substring(time.indexOf(_TIME_DIVIDER) + 1, time.indexOf(_RANDOM_TIME_DIVIDER));
    String randomValue = time.substring(time.indexOf(_RANDOM_TIME_DIVIDER) + 1, time.length);
    DateTime parsedTime = DateTime.parse(timeValue);
    DateTime parsedRandomTime = DateTime.parse(randomValue);
    date = DateTime.fromMillisecondsSinceEpoch(parsedTime.millisecondsSinceEpoch + parsedRandomTime.millisecondsSinceEpoch);
  }
}
