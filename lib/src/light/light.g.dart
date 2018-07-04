// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Light _$LightFromJson(Map<String, dynamic> json) {
  return new Light()
    ..id = json['id'] as int
    ..type = json['type'] as String
    ..name = json['name'] as String
    ..state = json['state'] == null
        ? null
        : new State.fromJson(json['state'] as Map<String, dynamic>)
    ..modelId = json['modelid'] as String
    ..uniqueId = json['uniqueid'] as String
    ..manufacturerName = json['manufacturername'] as String
    ..luminaireUniqueId = json['luminaireuniqueid'] as String
    ..swVersion = json['swversion'] as String;
}

abstract class _$LightSerializerMixin {
  int get id;
  String get type;
  String get name;
  State get state;
  String get modelId;
  String get uniqueId;
  String get manufacturerName;
  String get luminaireUniqueId;
  String get swVersion;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
        'name': name,
        'state': state,
        'modelid': modelId,
        'uniqueid': uniqueId,
        'manufacturername': manufacturerName,
        'luminaireuniqueid': luminaireUniqueId,
        'swversion': swVersion
      };
}

State _$StateFromJson(Map<String, dynamic> json) {
  return new State()
    ..on = json['on'] as bool
    ..brightness = json['bri'] as int
    ..hue = json['hue'] as int
    ..saturation = json['sat'] as int
    ..xy = (json['xy'] as List)?.map((e) => e as num)?.toList()
    ..ct = json['ct'] as int
    ..alert = json['alert'] as String
    ..effect = json['effect'] as String
    ..colorMode = json['colormode'] as String
    ..reachable = json['reachable'] as bool
    ..mode = json['mode'] as String;
}

abstract class _$StateSerializerMixin {
  bool get on;
  int get brightness;
  int get hue;
  int get saturation;
  List<num> get xy;
  int get ct;
  String get alert;
  String get effect;
  String get colorMode;
  bool get reachable;
  String get mode;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'on': on,
        'bri': brightness,
        'hue': hue,
        'sat': saturation,
        'xy': xy,
        'ct': ct,
        'alert': alert,
        'effect': effect,
        'colormode': colorMode,
        'reachable': reachable,
        'mode': mode
      };
}
