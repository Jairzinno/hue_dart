import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';

import 'package:hue_dart/src/core/serializers.dart';

part 'resource_link.g.dart';

abstract class ResourceLink
    with BridgeObject
    implements Built<ResourceLink, ResourceLinkBuilder> {
  @nullable
  String get id;

  /// Human readable name for this resourcelink
  @nullable
  String get name;

  /// Human readable description of what this resourcelink does. If not specified it's set to "".
  @nullable
  String get description;

  /// Not writeable and there is only 1 type: "Link"
  @nullable
  String get type;

  /// Not writeable, this respresents the owner (username) of the creator of the resourcelink
  @nullable
  String get owner;

  /// Class of resourcelink given by application.
  ///
  /// The resourcelink class can be used to identify resourcelink with the same purpose, like classid 1 for wake-up, 2 for going to sleep, etc.
  /// (best practice use range 1 - 10000)
  @BuiltValueField(wireName: 'classid')
  @nullable
  int get classId;

  /// References to resources which are used by this resourcelink resource
  ///
  /// In case the referenced resource was created with "recycle":true and no other references are present, the resourcelink resource will be automatically deleted when removed when empty.
  /// Allowed resources paths (given as ASCII String with pattern: "/<resource>/<resource id>":
  /// * Lights
  /// * Sensors
  /// * Groups
  /// * Scenes
  /// * Rules
  /// * Schedules
  /// * Resourcelinks
  @nullable
  BuiltList<String> get links;

  /// When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resourcelink. "false" when omitted.
  @nullable
  bool get recycle;

  static Serializer<ResourceLink> get serializer => _$resourceLinkSerializer;

  ResourceLink._();

  factory ResourceLink([updates(ResourceLinkBuilder b)]) = _$ResourceLink;

  factory ResourceLink.fromJson(Map json, {String id}) {
    return serializers
        .deserializeWith(ResourceLink.serializer, json)
        .rebuild((b) => b..id = id);
  }

  @override
  Map toBridgeObject({String action}) {
    Map result = serializers.serializeWith(ResourceLink.serializer, this);
    result.remove("id");
    return result;
  }
}
