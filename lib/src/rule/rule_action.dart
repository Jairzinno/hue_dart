import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'rule_action.g.dart';

abstract class RuleAction implements Built<RuleAction, RuleActionBuilder> {

  @nullable
  String get address;
  @nullable
  String get method;
  @nullable
  BuiltMap<String, String> get body;


  static Serializer<RuleAction> get serializer => _$ruleActionSerializer;

  RuleAction._();

  factory RuleAction([updates(RuleActionBuilder b)]) = _$RuleAction;

  factory RuleAction.fromJson(Map json) {
    return serializers.deserializeWith(
      RuleAction.serializer, json
    );
  }
}