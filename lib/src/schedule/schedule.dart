import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule extends Object with _$ScheduleSerializerMixin, BridgeObject {

  String id;
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
  @JsonKey(name: 'autodelete')
  bool autoDelete;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resource. “false” when omitted.
  bool recycle;

  ///Date presentation of the time for the schedule
  DateTime date;

  Command command;

  Schedule();

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

  Schedule.fromJsonManually(String id, Map<String, dynamic> json) {
    this.id = id;
    name = json['name'];
    description = json['description'];
    time = json['time'];
    status = json['status'];
    recycle = json['recycle'];
    command = new Command.fromJson(json['command']);
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  toBridgeObject({String action}) {
    if ('create' == action) {
      return {
        'name' : name,
        'description' :  description,
        'localtime' : time,
        'command' : command
      };
    } else if ('attributes' == action) {
      Map<String, dynamic> body = {};
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
  }
}

@JsonSerializable()
class Command extends Object with _$CommandSerializerMixin {
  ///Path to a light resource, a group resource or any other bridge resource (including "/api/<username>/")
  String address;

  ///The HTTP method used to send the body to the given address. Either "POST", "PUT", "DELETE" for local addresses.
  String method;

  ///JSON string to be sent to the relevant resource.
  Map<String, dynamic> body;


  Command();

  factory Command.fromJson(Map<String, dynamic> json) => _$CommandFromJson(json);

  Command.fromJsonManually(String id, Map<String, dynamic> json) {
    address = json['address'];
    body = json['body'];
    method = json['method'];
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
