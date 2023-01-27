import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'resource_link.g.dart';

abstract class ResourceLink
    with BridgeObject
    implements Built<ResourceLink, ResourceLinkBuilder> {
  String? get id;

  /// Human readable name for this resourcelink

  String? get name;

  /// Human readable description of what this resourcelink does. If not specified it's set to "".

  String? get description;

  /// Not writeable and there is only 1 type: "Link"

  String? get type;

  /// Not writeable, this respresents the owner (username) of the creator of the resourcelink

  String? get owner;

  /// Class of resourcelink given by application.
  ///
  /// The resourcelink class can be used to identify resourcelink with the same purpose, like classid 1 for wake-up, 2 for going to sleep, etc.
  /// (best practice use range 1 - 10000)
  @BuiltValueField(wireName: 'classid')
  int? get classId;

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

  BuiltList<String>? get links;

  /// When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resourcelink. "false" when omitted.

  bool? get recycle;

  static Serializer<ResourceLink> get serializer => _$resourceLinkSerializer;

  factory ResourceLink([Function(ResourceLinkBuilder b) updates]) =
      $ResourceLink;

  ResourceLink._();

  factory ResourceLink.fromJson(Map json, {String? id}) {
    return serializers
        .deserializeWith(ResourceLink.serializer, json)!
        .rebuild((b) => b..id = id);
  }

  @override
  Map toBridgeObject({String? action}) {
    final result = serializers.serializeWith(ResourceLink.serializer, this)!
        as Map<dynamic, dynamic>;
    result.remove('id');
    return result;
  }
}
