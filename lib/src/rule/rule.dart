import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:hue_dart/src/rule/condition.dart';
import 'package:hue_dart/src/rule/rule_action.dart';
import 'package:intl/intl.dart';

part 'rule.g.dart';

abstract class Rule with BridgeObject implements Built<Rule, RuleBuilder> {
  int? get id;

  /// Human readable name of the rule.

  String? get name;

  @BuiltValueField(wireName: 'lasttriggered')
  String? get lastTriggered;

  DateTime get lastTriggeredDate =>
      DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastTriggered!);

  @BuiltValueField(wireName: 'creationtime')
  String? get creationTime;

  DateTime get creationTimeDate =>
      DateFormat("yyyy-MM-dd'T'HH:m:s").parse(creationTime!);

  @BuiltValueField(wireName: 'timestriggered')
  int? get timesTriggered;

  String? get owner;

  String? get status;

  BuiltList<Condition>? get conditions;

  BuiltList<RuleAction>? get actions;

  bool? get recycle;

  static Serializer<Rule> get serializer => _$ruleSerializer;

  factory Rule([Function(RuleBuilder b) updates]) = $Rule;

  Rule._();

  factory Rule.fromJson(Map? json, {int? id}) {
    return serializers
        .deserializeWith(Rule.serializer, json)!
        .rebuild((b) => b..id = id);
  }

  @override
  Map toBridgeObject({String? action}) {
    final result = serializers.serializeWith(Rule.serializer, this)!
        as Map<dynamic, dynamic>;
    result.remove('id');
    return result;
  }
}
