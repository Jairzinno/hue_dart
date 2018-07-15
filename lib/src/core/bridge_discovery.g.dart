// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_discovery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryResult _$DiscoveryResultFromJson(Map<String, dynamic> json) {
  return new DiscoveryResult()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..mac = json['mac'] as String
    ..apiVersion = json['apiversion'] as String
    ..ipAddress = json['internalipaddress'] as String
    ..swVersion = json['swversion'] as String;
}

abstract class _$DiscoveryResultSerializerMixin {
  String get id;
  String get name;
  String get mac;
  String get apiVersion;
  String get ipAddress;
  String get swVersion;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('name', name);
    writeNotNull('mac', mac);
    writeNotNull('apiversion', apiVersion);
    writeNotNull('internalipaddress', ipAddress);
    writeNotNull('swversion', swVersion);
    return val;
  }
}
