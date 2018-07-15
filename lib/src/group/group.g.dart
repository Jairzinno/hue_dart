// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return new Group()
    ..id = json['id'] as int
    ..type = json['type'] as String
    ..name = json['name'] as String
    ..className = json['class'] as String
    ..lights =
        json['lights'] == null ? null : _mapFromJsonLights(json['lights'])
    ..recycle = json['recycle'] as bool
    ..modelId = json['modelid'] as String
    ..uniqueId = json['uniqueid'] as String
    ..state = json['state'] == null
        ? null
        : new OnState.fromJson(json['state'] as Map<String, dynamic>)
    ..action = json['action'] == null
        ? null
        : new Action.fromJson(json['action'] as Map<String, dynamic>);
}

abstract class _$GroupSerializerMixin {
  int get id;
  String get type;
  String get name;
  String get className;
  List<Light> get lights;
  bool get recycle;
  String get modelId;
  String get uniqueId;
  OnState get state;
  Action get action;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': id,
      'type': type,
      'name': name,
      'class': className,
      'lights': lights,
      'recycle': recycle,
      'modelid': modelId,
      'uniqueid': uniqueId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('state', state);
    writeNotNull('action', action);
    return val;
  }
}

OnState _$OnStateFromJson(Map<String, dynamic> json) {
  return new OnState()
    ..anyOn = json['any_on'] as bool
    ..allOn = json['all_on'] as bool;
}

abstract class _$OnStateSerializerMixin {
  bool get anyOn;
  bool get allOn;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('any_on', anyOn);
    writeNotNull('all_on', allOn);
    return val;
  }
}

Action _$ActionFromJson(Map<String, dynamic> json) {
  return new Action()
    ..on = json['on'] as bool
    ..brightness = json['bri'] as int
    ..hue = json['hue'] as int
    ..saturation = json['sat'] as int
    ..xy = (json['xy'] as List)?.map((e) => e as num)?.toList()
    ..ct = json['ct'] as int
    ..alert = json['alert'] as String
    ..effect = json['effect'] as String
    ..colorMode = json['colormode'] as String
    ..scene = json['scene'] as String;
}

abstract class _$ActionSerializerMixin {
  bool get on;
  int get brightness;
  int get hue;
  int get saturation;
  List<num> get xy;
  int get ct;
  String get alert;
  String get effect;
  String get colorMode;
  String get scene;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('on', on);
    writeNotNull('bri', brightness);
    writeNotNull('hue', hue);
    writeNotNull('sat', saturation);
    writeNotNull('xy', xy);
    writeNotNull('ct', ct);
    writeNotNull('alert', alert);
    writeNotNull('effect', effect);
    writeNotNull('colormode', colorMode);
    writeNotNull('scene', scene);
    return val;
  }
}
