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
  @nullable
  int get id;

  /// Human readable name of the rule.
  @nullable
  String get name;

  @BuiltValueField(wireName: 'lasttriggered')
  @nullable
  String get lastTriggered;

  DateTime get lastTriggeredDate =>
      new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastTriggered);

  @BuiltValueField(wireName: 'creationtime')
  @nullable
  String get creationTime;

  DateTime get creationTimeDate =>
      new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(creationTime);

  @BuiltValueField(wireName: 'timestriggered')
  @nullable
  int get timesTriggered;

  @nullable
  String get owner;

  @nullable
  String get status;

  @nullable
  BuiltList<Condition> get conditions;

  @nullable
  BuiltList<RuleAction> get actions;

  @nullable
  bool get recycle;

  static Serializer<Rule> get serializer => _$ruleSerializer;

  Rule._();

  factory Rule([updates(RuleBuilder b)]) = _$Rule;

  factory Rule.fromJson(Map json, {int id}) {
    return serializers
        .deserializeWith(Rule.serializer, json)
        .rebuild((b) => b..id = id);
  }

  @override
  Map toBridgeObject({String action}) {
    Map result = serializers.serializeWith(Rule.serializer, this);
    result.remove('id');
    return result;
  }
}
