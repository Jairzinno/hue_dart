// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scene _$SceneFromJson(Map<String, dynamic> json) {
  return new Scene()
    ..name = json['name'] as String
    ..lights =
        json['lights'] == null ? null : _mapFromJsonLights(json['lights'])
    ..owner = json['owner'] as String
    ..recycle = json['recycle'] as bool
    ..locked = json['locked'] as bool
    ..lastUpdated = json['lastupdated'] as String
    ..version = json['version'] as int
    ..appData = json['appdata'] == null
        ? null
        : new AppData.fromJson(json['appdata'] as Map<String, dynamic>)
    ..picture = json['picture'] as String;
}

abstract class _$SceneSerializerMixin {
  String get name;
  List<Light> get lights;
  String get owner;
  bool get recycle;
  bool get locked;
  String get lastUpdated;
  int get version;
  AppData get appData;
  String get picture;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'lights': lights == null ? null : _mapToJsonLights(lights),
        'owner': owner,
        'recycle': recycle,
        'locked': locked,
        'lastupdated': lastUpdated,
        'version': version,
        'appdata': appData,
        'picture': picture
      };
}

AppData _$AppDataFromJson(Map<String, dynamic> json) {
  return new AppData()
    ..version = json['version'] as int
    ..data = json['data'] as String;
}

abstract class _$AppDataSerializerMixin {
  int get version;
  String get data;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('version', version);
    writeNotNull('data', data);
    return val;
  }
}
