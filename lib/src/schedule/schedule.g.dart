// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return new Schedule()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..time = json['localtime'] as String
    ..status = json['status'] as String
    ..autoDelete = json['autodelete'] as bool
    ..recycle = json['recycle'] as bool
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..command = json['command'] == null
        ? null
        : new Command.fromJson(json['command'] as Map<String, dynamic>);
}

abstract class _$ScheduleSerializerMixin {
  String get id;
  String get name;
  String get description;
  String get time;
  String get status;
  bool get autoDelete;
  bool get recycle;
  DateTime get date;
  Command get command;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'localtime': time,
        'status': status,
        'autodelete': autoDelete,
        'recycle': recycle,
        'date': date?.toIso8601String(),
        'command': command
      };
}

Command _$CommandFromJson(Map<String, dynamic> json) {
  return new Command()
    ..address = json['address'] as String
    ..method = json['method'] as String
    ..body = json['body'] as Map<String, dynamic>;
}

abstract class _$CommandSerializerMixin {
  String get address;
  String get method;
  Map<String, dynamic> get body;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'address': address, 'method': method, 'body': body};
}
