// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceLink _$ResourceLinkFromJson(Map<String, dynamic> json) {
  return new ResourceLink()
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..type = json['type'] as String
    ..owner = json['owner'] as String
    ..classId = json['classid'] as int
    ..links = (json['links'] as List)?.map((e) => e as String)?.toList()
    ..recycle = json['recycle'] as bool;
}

abstract class _$ResourceLinkSerializerMixin {
  String get name;
  String get description;
  String get type;
  String get owner;
  int get classId;
  List<String> get links;
  bool get recycle;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('name', name);
    writeNotNull('description', description);
    writeNotNull('type', type);
    writeNotNull('owner', owner);
    writeNotNull('classid', classId);
    writeNotNull('links', links);
    writeNotNull('recycle', recycle);
    return val;
  }
}
