class Schedule {

  static const int MONDAY = 1 << 12;
  static const int TUESDAY = 1 << 10;
  static const int WEDNESDAY = 1 << 8;
  static const int THURSDAY = 1 << 6;
  static const int FRIDAY = 1 << 4;
  static const int SATURDAY = 1 << 2;
  static const int SUNDAY = 1;
  
  ///Name for the new schedule. If a name is not specified then the default name, “schedule”, is used.
  ///If the name is already taken a space and number will be appended by the bridge, e.g. “schedule 1”.
  String name;

  ///Description of the new schedule. If the description is not specified it will be empty.
  String description;

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
  String time;


  ///"enabled"  Schedule is enabled
  ///"disabled"  Schedule is disabled by user.
  ///Application is only allowed to set “enabled” or “disabled”. Disabled causes a timer to reset when activated (i.e. stop & reset). “enabled” when not provided on creation.
  String status;

  ///If set to true, the schedule will be removed automatically if expired, if set to false it will be disabled. Default is true. Only visible for non-recurring schedules.
  bool autoDelete;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resource. “false” when omitted.
  bool recycle;

  ///Path to a light resource, a group resource or any other bridge resource (including "/api/<username>/")
  String address;

  ///The HTTP method used to send the body to the given address. Either "POST", "PUT", "DELETE" for local addresses.
  String method;

  ///JSON string to be sent to the relevant resource.
  String body;

  ///Date presentation of the time for the schedule
  DateTime date;
}
