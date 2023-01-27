import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'discovery_result.g.dart';

abstract class DiscoveryResult
    implements Built<DiscoveryResult, DiscoveryResultBuilder> {
  String? get id;

  String? get name;

  String? get mac;

  @BuiltValueField(wireName: 'apiversion')
  String? get apiVersion;

  @BuiltValueField(wireName: 'internalipaddress')
  String? get ipAddress;

  @BuiltValueField(wireName: 'swversion')
  String? get swVersion;

  static Serializer<DiscoveryResult> get serializer =>
      _$discoveryResultSerializer;

  factory DiscoveryResult([Function(DiscoveryResultBuilder b) updates]) =
      $DiscoveryResult;

  DiscoveryResult._();

  factory DiscoveryResult.fromJson(Map json) {
    return serializers.deserializeWith(DiscoveryResult.serializer, json)!;
  }
}
