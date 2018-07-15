// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BridgeException _$BridgeExceptionFromJson(Map<String, dynamic> json) {
  return new BridgeException()
    ..address = json['address'] as String
    ..description = json['description'] as String
    ..type = json['type'];
}

abstract class _$BridgeExceptionSerializerMixin {
  String get address;
  String get description;
  dynamic get type;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'description': description,
        'type': type
      };
}
