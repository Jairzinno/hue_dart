import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scene.g.dart';

@JsonSerializable()
class Scene extends Object with _$SceneSerializerMixin, BridgeObject {
  /// The id of the scene being modified or created.
  String id;

  /// Human readable name of the scene. Is set to <id> if omitted on creation.
  String name;

  /// The light ids which are in the scene. This array can empty. As of 1.11 it must contain at least 1 element. If an invalid lights resource is given, error 7 is returned and the scene is not created.
  ///
  /// When writing, lightstate of all lights in list will be overwritten with current light state.
  /// As of 1.15 when writing, lightstate of lights which are not yet in list will be created with current light state.
  @JsonKey(fromJson: _mapFromJsonLights)
  List<Light> lights;

  /// Whitelist user that created or modified the content of the scene. Note that changing name does not change the owner.
  String owner;

  /// Indicates whether the scene can be automatically deleted by the bridge.
  /// Only available by POST. Set to 'false' when omitted.
  /// Legacy scenes created by PUT are defaulted to true. When set to 'false' the bridge keeps the scene until deleted by an application.
  bool recycle;

  /// Indicates that the scene is locked by a rule or a schedule and cannot be deleted until all resources requiring or that reference the scene are deleted.
  bool locked;

  /// UTC time the scene has been created or has been updated by a PUT. Will be null when unknown (legacy scenes).
  @JsonKey(name: 'lastupdated')
  String lastUpdated;

  /// Version of scene document:
  ///
  /// 1 - Scene created via PUT, lightstates will be empty.
  /// 2 - Scene created via POST lightstates available.
  int version;

  /// App specific data linked to the scene.
  /// Each individual application should take responsibility for the data written in this field.
  @JsonKey(name: 'appdata')
  AppData appData;

  String picture;

  Scene();

  factory Scene.fromJson(Map<String, dynamic> json) => _$SceneFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  toBridgeObject({String action}) {
    if ('create' == action) {
      return {
        'name' : name,
        'recycle' : recycle ?? false,
        'lights' : lights.map((Light light) => light.id.toString()).toList()
      };
    } else if ('attributes' == action) {
      final body = {};
      if (name != null) {
        body['name'] = name;
      }
      if (lights != null) {
        body['lights'] = lights.map((Light light) => light.id.toString()).toList();
      }
      return body;
    }
  }
}

@JsonSerializable()
class AppData extends Object with _$AppDataSerializerMixin {
  /// App specific version of the data field.
  int version;

  /// App specific data. Free format string.
  String data;

  AppData();

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);

  AppData.fromJsonManually(Map<String, dynamic> json) {
    version = json['version'];
    data = json['data'];
  }

  @override
  String toString() {
    return toJson().toString();
  }

}

List<Light> _mapFromJsonLights(dynamic lights) {
  var source = lights as List<String>;
  var result = source.map((String id) => new Light.withId(id)).toList();
  return result;
}
