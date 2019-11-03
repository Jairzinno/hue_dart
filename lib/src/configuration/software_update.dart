import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/configuration/auto_install.dart';
import 'package:hue_dart/src/configuration/software_update_bridge.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'software_update.g.dart';

abstract class SoftwareUpdate
    implements Built<SoftwareUpdate, SoftwareUpdateBuilder> {
  /// Setting this flag to true lets the bridge search for software updates in the portal.
  ///
  /// After the search attempt, this flag is set back to false.
  /// Requires portal connection to update server.
  /// See software update for more information.

  @nullable
  @BuiltValueField(wireName: 'checkforupdate')
  bool get checkForUpdate;

  @nullable
  @BuiltValueField(wireName: 'lastchange')
  String get lastChange;

  @nullable
  String get state;

  @nullable
  SoftwareUpdateBridge get bridge;

  @nullable
  @BuiltValueField(wireName: 'autoinstall')
  AutoInstall get autoInstall;

  static Serializer<SoftwareUpdate> get serializer =>
      _$softwareUpdateSerializer;

  SoftwareUpdate._();

  factory SoftwareUpdate([updates(SoftwareUpdateBuilder b)]) = _$SoftwareUpdate;

  factory SoftwareUpdate.fromJson(Map json) {
    return serializers.deserializeWith(SoftwareUpdate.serializer, json);
  }
}
