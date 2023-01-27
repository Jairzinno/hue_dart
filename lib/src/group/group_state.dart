import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'group_state.g.dart';

abstract class GroupState implements Built<GroupState, GroupStateBuilder> {
  /// “false” if all lamps are off, “true” if at least one lamp is on

  @BuiltValueField(wireName: 'any_on')
  bool? get anyOn;

  /// “false” if at least one lamp is off, “true” if all lamps are on

  @BuiltValueField(wireName: 'all_on')
  bool? get allOn;

  static Serializer<GroupState> get serializer => _$groupStateSerializer;

  factory GroupState([Function(GroupStateBuilder b) updates]) = $GroupState;

  GroupState._();

  static GroupState? fromJson(String jsonString) {
    return serializers.deserializeWith(
      GroupState.serializer,
      json.decode(jsonString),
    );
  }
}
