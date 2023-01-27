import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'portal_state.g.dart';

abstract class PortalState implements Built<PortalState, PortalStateBuilder> {
  String get communication;
  bool get incoming;
  bool get outgoing;

  @BuiltValueField(wireName: 'signedon')
  bool get signedOn;

  static Serializer<PortalState> get serializer => _$portalStateSerializer;

  factory PortalState([Function(PortalStateBuilder b) updates]) = $PortalState;

  PortalState._();

  factory PortalState.fromJson(Map json) {
    return serializers.deserializeWith(PortalState.serializer, json)!;
  }
}
