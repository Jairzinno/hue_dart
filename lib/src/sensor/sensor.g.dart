// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sensor _$SensorFromJson(Map<String, dynamic> json) {
  return new Sensor()
    ..type = json['type'] as String
    ..name = json['name'] as String
    ..modelId = json['modelid'] as String
    ..uniqueId = json['uniqueid'] as String
    ..manufacturerName = json['manufacturername'] as String
    ..swVersion = json['swversion'] as String
    ..recycle = json['recycle'] as bool
    ..reachable = json['reachable'] as bool
    ..on = json['on'] as bool
    ..battery = json['battery'] as int
    ..state = json['state'] as Map<String, dynamic>
    ..config = json['config'] == null
        ? null
        : new SensorConfig.fromJson(json['config'] as Map<String, dynamic>);
}

abstract class _$SensorSerializerMixin {
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
  Map<String, dynamic> get state;
  SensorConfig get config;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type,
      'name': name,
      'modelid': modelId,
      'uniqueid': uniqueId,
      'manufacturername': manufacturerName,
      'swversion': swVersion,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('recycle', recycle);
    writeNotNull('reachable', reachable);
    writeNotNull('on', on);
    writeNotNull('battery', battery);
    writeNotNull('state', state);
    writeNotNull('config', config);
    return val;
  }
}

SensorConfig _$SensorConfigFromJson(Map<String, dynamic> json) {
  return new SensorConfig()
    ..on = json['on'] as bool
    ..reachable = json['reachable'] as bool
    ..battery = json['battery'] as int;
}

abstract class _$SensorConfigSerializerMixin {
  bool get on;
  bool get reachable;
  int get battery;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('on', on);
    writeNotNull('reachable', reachable);
    writeNotNull('battery', battery);
    return val;
  }
}
