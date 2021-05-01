import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:intl/intl.dart';

part 'software_update_bridge.g.dart';

abstract class SoftwareUpdateBridge
    implements Built<SoftwareUpdateBridge, SoftwareUpdateBridgeBuilder> {
  String get state;

  @BuiltValueField(wireName: 'lastinstall')
  String get lastInstall;

  @memoized
  DateTime get lastInstallDate =>
      DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastInstall);

  static Serializer<SoftwareUpdateBridge> get serializer =>
      _$softwareUpdateBridgeSerializer;

  SoftwareUpdateBridge._();

  factory SoftwareUpdateBridge([updates(SoftwareUpdateBridgeBuilder b)?]) =
      _$SoftwareUpdateBridge;

  factory SoftwareUpdateBridge.fromJson(Map json) {
    return serializers.deserializeWith(SoftwareUpdateBridge.serializer, json)!;
  }
}
