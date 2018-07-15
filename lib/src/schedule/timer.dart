import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:intl/intl.dart';

class Timer extends Schedule {

  ///Indicate how many times a timer is repeated
  int recurrence;


  Timer();

  Timer.withSchedule(Schedule schedule) : super.withSchedule(schedule) {
    _parseTimer();
  }

  void _parseTimer() {
    if (new RegExp(Schedule.RECURRING_RANDOM_TIMER).hasMatch(time)) {
      _parseRecurringRandomTimer();
    } else if (new RegExp(Schedule.RECURRING_TIMER_1).hasMatch(time)) {
      _parseFirstTypeOfRecurringTimer();
    } else if (new RegExp(Schedule.RECURRING_TIMER_2).hasMatch(time)) {
      _parseSecondTypeOfRecurringTimer();
    } else if (new RegExp(Schedule.RANDOM_TIMER).hasMatch(time)) {
      _parseRandomTimer();
    } else if (new RegExp(Schedule.EXPIRING_TIMER).hasMatch(time)) {
      _parseExpiringTimer();
    }
  }

  void _parseExpiringTimer() {
    String timeValue = time.substring(2, time.length);
    date = new DateFormat(Schedule.TIME_PATTERN).parse(timeValue);
  }

  void _parseRandomTimer() {
    String dateValue = time.substring(0, time.indexOf(Schedule.RANDOM_TIME_DIVIDER));
    String randomValue = time.substring(time.indexOf(Schedule.RANDOM_TIME_DIVIDER));
    date = new DateFormat("'PT'HH:m:s").parse(dateValue);
    randomTime = new DateFormat("'A'HH:m:s").parse(randomValue);
  }

  void _parseFirstTypeOfRecurringTimer() {
    recurrence = 0;
    String repeatedValue = time.substring(1, time.indexOf("/"));
    if (repeatedValue.length > 0) {
      recurrence = int.parse(repeatedValue);
    }
    String timeValue = time.substring(time.indexOf(Schedule.TIME_DIVIDER) + 1, time.length);
    date = new DateFormat(Schedule.TIME_PATTERN).parse(timeValue);
  }

  void _parseSecondTypeOfRecurringTimer() {
    String timeValue = time.substring(4, time.length);
    date = new DateFormat(Schedule.TIME_PATTERN).parse(timeValue);
  }

  void _parseRecurringRandomTimer() {
    recurrence = int.parse(time.substring(1, time.indexOf("/")));
    String timeValue = time.substring(time.indexOf(Schedule.TIME_DIVIDER) + 1, time.indexOf(Schedule.RANDOM_TIME_DIVIDER));
    String randomValue = time.substring(time.indexOf(Schedule.RANDOM_TIME_DIVIDER) + 1, time.length);
    date = new DateFormat(Schedule.TIME_PATTERN).parse(timeValue);
    randomTime = new DateFormat(Schedule.TIME_PATTERN).parse(randomValue);
  }

  String getFormattedTime() {
    if (isRepeated()) {
      return getRepeatedFormattedTime();
    } else {
      return getDefaultFormattedTime();
    }
  }

  bool isRepeated() {
    return recurrence > 0;
  }

  String getRepeatedFormattedTime() {
    String formattedTime = new DateFormat(Schedule.TIME_PATTERN).format(DateTime.now());
    return "R${recurrence}/PT${formattedTime}";
  }

  String getDefaultFormattedTime() {
    String formattedTime = new DateFormat(Schedule.TIME_PATTERN).format(DateTime.now());
    return "PT$formattedTime";
  }

  int getRecurrence() {
    return recurrence;
  }

  void setRecurrence(int recurrence) {
    this.recurrence = recurrence;
  }
}
