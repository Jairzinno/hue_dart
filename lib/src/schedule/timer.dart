import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:intl/intl.dart';

class Timer extends Schedule {
  static const String _EXPIRING_TIMER = "PT\\d*:\\d*:\\d*";
  static const String _RANDOM_TIMER = "PT\\d*:\\d*:\\d*A\\d*:\\d*:\\d*";
  static const String _RECURRING_TIMER_1 = "R\\d*/PT\\d*:\\d*:\\d*";
  static const String _RECURRING_TIMER_2 = "R/PT\\d*:\\d*:\\d*";
  static const String _RECURRING_RANDOM_TIMER = "R\\d*/PT\\d*:\\d*:\\d*A\\d*:\\d*:\\d*";
  static const String _TIME_PATTERN = "HH:mm:ss";
  static const String _TIME_DIVIDER = "T";
  static const String _RANDOM_TIME_DIVIDER = "A";

  ///Indicate how many times a timer is repeated
  int repeated;


  Timer() {
    _parseTimer();
  }

  static bool isTimer(String time) {
    return RegExp(_EXPIRING_TIMER).hasMatch(time) ||
        RegExp(_RANDOM_TIMER).hasMatch(time) ||
        RegExp(_RECURRING_TIMER_1).hasMatch(time) ||
        RegExp(_RECURRING_TIMER_2).hasMatch(time) ||
        RegExp(_RECURRING_RANDOM_TIMER).hasMatch(time);
  }

  String getFormattedTime() {
    if (isRepeated()) {
      return getRepeatedFormattedTime();
    } else {
      return getDefaultFormattedTime();
    }
  }

  bool isRepeated() {
    return repeated > 0;
  }

  String getRepeatedFormattedTime() {
    String formattedTime = DateFormat(_TIME_PATTERN).format(DateTime.now());
    return "R${repeated}/PT${formattedTime}";
  }

  String getDefaultFormattedTime() {
    String formattedTime = DateFormat(_TIME_PATTERN).format(DateTime.now());
    return "PT$formattedTime";
  }

  void _parseTimer() {
    if (RegExp(_EXPIRING_TIMER).hasMatch(time)) {
      _parseExpiringTimer();
    }
    if (RegExp(_RANDOM_TIMER).hasMatch(time)) {
      _parseRandomTimer();
    }
    if (RegExp(_RECURRING_TIMER_1).hasMatch(time)) {
      _parseFirstTypeOfRecurringTimer();
    }
    if (RegExp(_RECURRING_TIMER_2).hasMatch(time)) {
      _parseSecondTypeOfRecurringTimer();
    }
    if (RegExp(_RECURRING_RANDOM_TIMER).hasMatch(time)) {
      _parseRecurringRandomTimer();
    }
  }

  void _parseExpiringTimer() {
    String timeValue = time.substring(2, time.length);
    date = DateFormat(_TIME_PATTERN).parse(timeValue);
  }

  void _parseRandomTimer() {
    String timeValue = time.substring(2, time.length);
    String randomValue = time.substring(time.indexOf(_RANDOM_TIME_DIVIDER) + 1, time.length);
    DateTime parsedTime = DateFormat(_TIME_PATTERN).parse(timeValue);
    DateTime parsedRandomTime = DateFormat(_TIME_PATTERN).parse(randomValue);
    date = DateTime.fromMillisecondsSinceEpoch(parsedTime.millisecondsSinceEpoch + parsedRandomTime.millisecondsSinceEpoch);
  }

  void _parseFirstTypeOfRecurringTimer() {
    repeated = 0;
    String repeatedValue = time.substring(1, time.indexOf("/"));
    if (repeatedValue.length > 0) {
      repeated = int.parse(repeatedValue);
    }
    String timeValue = time.substring(time.indexOf(_TIME_DIVIDER) + 1, time.length);
    date = DateFormat(_TIME_PATTERN).parse(timeValue);
  }

  void _parseSecondTypeOfRecurringTimer() {
    String timeValue = time.substring(4, time.length);
    date = DateFormat(_TIME_PATTERN).parse(timeValue);
  }

  void _parseRecurringRandomTimer() {
    repeated = int.parse(time.substring(1, time.indexOf("/")));
    String timeValue = time.substring(time.indexOf(_TIME_DIVIDER) + 1, time.indexOf(_RANDOM_TIME_DIVIDER));
    String randomValue = time.substring(time.indexOf(_RANDOM_TIME_DIVIDER) + 1, time.length);
    DateTime parsedTime = DateFormat(_TIME_PATTERN).parse(timeValue);
    DateTime parsedRandomTime = DateFormat(_TIME_PATTERN).parse(randomValue);
    date = DateTime.fromMillisecondsSinceEpoch(parsedTime.millisecondsSinceEpoch + parsedRandomTime.millisecondsSinceEpoch);
  }
}
