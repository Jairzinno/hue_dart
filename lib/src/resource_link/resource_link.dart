import 'package:json_annotation/json_annotation.dart';

part 'resource_link.g.dart';

@JsonSerializable()
class ResourceLink extends Object with _$ResourceLinkSerializerMixin {

  @JsonKey(ignore: true)
  String id;

  /// Human readable name for this resourcelink
  @JsonKey(includeIfNull: false)
  String name;

  /// Human readable description of what this resourcelink does. If not specified it's set to "".
  @JsonKey(includeIfNull: false)
  String description;

  /// Not writeable and there is only 1 type: "Link"
  @JsonKey(includeIfNull: false)
  String type;

  /// Not writeable, this respresents the owner (username) of the creator of the resourcelink
  @JsonKey(includeIfNull: false)
  String owner;

  /// Class of resourcelink given by application.
  ///
  /// The resourcelink class can be used to identify resourcelink with the same purpose, like classid 1 for wake-up, 2 for going to sleep, etc.
  /// (best practice use range 1 - 10000)
  @JsonKey(name: 'classid', includeIfNull: false)
  int classId;

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
  @JsonKey(includeIfNull: false)
  List<String> links;

  /// When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resourcelink. "false" when omitted.
  @JsonKey(includeIfNull: false)
  bool recycle;

  ResourceLink();

  factory ResourceLink.fromJson(Map<String, dynamic> json) => _$ResourceLinkFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }
}
