import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'condition.g.dart';

abstract class Condition
    with BridgeObject
    implements Built<Condition, ConditionBuilder> {
  String? get address;

  String? get operator;

  String? get value;

  static Serializer<Condition> get serializer => _$conditionSerializer;

  factory Condition([Function(ConditionBuilder b) updates]) = $Condition;

  Condition._();

  factory Condition.fromJson(Map json) {
    return serializers.deserializeWith(serializer, json)!;
  }

  @override
  Map toBridgeObject({String? action}) {
    return serializers.serializeWith(serializer, this)!
        as Map<dynamic, dynamic>;
  }
}
