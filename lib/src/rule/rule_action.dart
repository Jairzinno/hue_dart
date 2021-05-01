import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'rule_action.g.dart';

abstract class RuleAction implements Built<RuleAction, RuleActionBuilder> {
  String? get address;

  String? get method;

  BuiltMap<String, String>? get body;

  static Serializer<RuleAction> get serializer => _$ruleActionSerializer;

  factory RuleAction([Function(RuleActionBuilder b) updates]) = _$RuleAction;

  RuleAction._();

  factory RuleAction.fromJson(Map json) {
    return serializers.deserializeWith(RuleAction.serializer, json)!;
  }
}
