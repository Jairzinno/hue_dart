import 'package:hue_dart/src/light/light.dart';

class Scene {
  /// The id of the scene being modified or created.
  String id;

  /// Human readable name of the scene. Is set to <id> if omitted on creation.
  String name;

  /// The light ids which are in the scene. This array can empty. As of 1.11 it must contain at least 1 element. If an invalid lights resource is given, error 7 is returned and the scene is not created.
  ///
  /// When writing, lightstate of all lights in list will be overwritten with current light state.
  /// As of 1.15 when writing, lightstate of lights which are not yet in list will be created with current light state.
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
  String lastUpdated;

  /// Version of scene document:
  ///
  /// 1 - Scene created via PUT, lightstates will be empty.
  /// 2 - Scene created via POST lightstates available.
  int version;

  /// App specific data linked to the scene.
  /// Each individual application should take responsibility for the data written in this field.
  AppData appData;
}

class AppData {
  /// App specific version of the data field.
  int version;

  /// App specific data. Free format string.
  String data;
}
