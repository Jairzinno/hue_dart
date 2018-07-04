// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceLink _$ResourceLinkFromJson(Map<String, dynamic> json) {
  return new ResourceLink()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..type = json['type'] as String
    ..owner = json['owner'] as String
    ..classId = json['classid'] as int
    ..links = (json['links'] as List)?.map((e) => e as String)?.toList()
    ..recycle = json['recycle'] as bool;
}

abstract class _$ResourceLinkSerializerMixin {
  String get id;
  String get name;
  String get description;
  String get type;
  String get owner;
  int get classId;
  List<String> get links;
  bool get recycle;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'type': type,
        'owner': owner,
        'classid': classId,
        'links': links,
        'recycle': recycle
      };
}
