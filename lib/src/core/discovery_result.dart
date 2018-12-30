import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'discovery_result.g.dart';

abstract class DiscoveryResult implements Built<DiscoveryResult, DiscoveryResultBuilder> {

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  String get mac;

  @nullable
  @BuiltValueField(wireName: 'apiversion')
  String get apiVersion;

  @nullable
  @BuiltValueField(wireName: 'internalipaddress')
  String get ipAddress;

  @nullable
  @BuiltValueField(wireName: 'swversion')
  String get swVersion;

  static Serializer<DiscoveryResult> get serializer => _$discoveryResultSerializer;

  DiscoveryResult._();

  factory DiscoveryResult([updates(DiscoveryResultBuilder b)]) = _$DiscoveryResult;

  factory DiscoveryResult.fromJson(Map json) {
    return serializers.deserializeWith(
      DiscoveryResult.serializer, json
    );
  }
}