class ResourceLink {

  /// Human readable name for this resourcelink
  String name;

  /// Human readable description of what this resourcelink does. If not specified it's set to "".
  String description;

  /// Not writeable and there is only 1 type: "Link"
  String type;

  /// Not writeable, this respresents the owner (username) of the creator of the resourcelink
  String owner;

  /// Class of resourcelink given by application.
  ///
  /// The resourcelink class can be used to identify resourcelink with the same purpose, like classid 1 for wake-up, 2 for going to sleep, etc.
  /// (best practice use range 1 - 10000)
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
  List<String> links;

  /// When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resourcelink. "false" when omitted.
  bool recycle;
}
