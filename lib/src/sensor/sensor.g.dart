// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sensor _$SensorFromJson(Map<String, dynamic> json) {
  return new Sensor()
    ..id = json['id'] as int
    ..type = json['type'] as String
    ..name = json['name'] as String
    ..modelId = json['modelid'] as String
    ..uniqueId = json['uniqueid'] as String
    ..manufacturerName = json['manufacturername'] as String
    ..swVersion = json['swversion'] as String
    ..recycle = json['recycle'] as bool
    ..reachable = json['reachable'] as bool
    ..on = json['on'] as bool
    ..battery = json['battery'] as int;
}

abstract class _$SensorSerializerMixin {
  int get id;
  String get type;
  String get name;
  String get modelId;
  String get uniqueId;
  String get manufacturerName;
  String get swVersion;
  bool get recycle;
  bool get reachable;
  bool get on;
  int get battery;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
        'name': name,
        'modelid': modelId,
        'uniqueid': uniqueId,
        'manufacturername': manufacturerName,
        'swversion': swVersion,
        'recycle': recycle,
        'reachable': reachable,
        'on': on,
        'battery': battery
      };
}
