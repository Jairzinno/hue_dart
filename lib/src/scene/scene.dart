import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/scene/app_data.dart';
import 'package:intl/intl.dart';

part 'scene.g.dart';

abstract class Scene with BridgeObject implements Built<Scene, SceneBuilder> {
  /// The id of the scene being modified or created.
  @nullable
  String get id;

  /// Human readable name of the scene. Is set to <id> if omitted on creation.
  @nullable
  String get name;

  /// The light ids which are in the scene. This array can empty. As of 1.11 it must contain at least 1 element. If an invalid lights resource is given, error 7 is returned and the scene is not created.
  ///
  /// When writing, lightstate of all lights in list will be overwritten with current light state.
  /// As of 1.15 when writing, lightstate of lights which are not yet in list will be created with current light state.
  @BuiltValueField(wireName: 'lights')
  @nullable
  BuiltList<String> get lightIds;

  @nullable
  BuiltList<Light> get lights;

  /// Whitelist user that created or modified the content of the scene. Note that changing name does not change the owner.
  @nullable
  String get owner;

  /// Indicates whether the scene can be automatically deleted by the bridge.
  /// Only available by POST. Set to 'false' when omitted.
  /// Legacy scenes created by PUT are defaulted to true. When set to 'false' the bridge keeps the scene until deleted by an application.
  @nullable
  bool get recycle;

  /// Indicates that the scene is locked by a rule or a schedule and cannot be deleted until all resources requiring or that reference the scene are deleted.
  @nullable
  bool get locked;

  /// UTC time the scene has been created or has been updated by a PUT. Will be null when unknown (legacy scenes).
  @BuiltValueField(wireName: 'lastupdated')
  @nullable
  String get lastUpdated;

  DateTime get lastUpdatedDate =>
      new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastUpdated);

  /// Version of scene document:
  ///
  /// 1 - Scene created via PUT, lightstates will be empty.
  /// 2 - Scene created via POST lightstates available.
  @nullable
  int get version;

  /// App specific data linked to the scene.
  /// Each individual application should take responsibility for the data written in this field.
  @BuiltValueField(wireName: 'appdata')
  @nullable
  AppData get appData;

  @nullable
  String get picture;

  @override
  Map toBridgeObject({String action}) {
    if ('create' == action) {
      return {
        'name': name,
        'recycle': recycle ?? false,
        'lights': lightIds.toList()
      };
    } else if ('attributes' == action) {
      final body = {};
      if (name != null) {
        body['name'] = name;
      }
      if (lightIds != null) {
        body['lights'] = lightIds.toList();
      }
      return body;
    }
    return {};
  }

  static Serializer<Scene> get serializer => _$sceneSerializer;

  Scene._();

  factory Scene([updates(SceneBuilder b)]) = _$Scene;

  factory Scene.fromJson(Map json, {String id}) {
    return serializers
        .deserializeWith(Scene.serializer, json)
        .rebuild((b) => b..id = id);
  }
}
