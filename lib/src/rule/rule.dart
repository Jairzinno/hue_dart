import 'package:json_annotation/json_annotation.dart';

part 'rule.g.dart';

@JsonSerializable()
class Rule extends Object with _$RuleSerializerMixin {

  int id;

  /// Human readable name of the rule.
  String name;

  @JsonKey(name: 'lasttriggered')
  String lastTriggered;

  @JsonKey(name: 'creationtime')
  String creationTime;

  @JsonKey(name: 'timestriggered')
  int timesTriggered;

  String owner;

  String status;

  List<Condition> conditions;

  List<Action> actions;

  bool recycle;

  Rule();

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Rule.fromJsonManually(String id, Map<String, dynamic> json) {
    this.id = int.parse(id);
    name = json['name'];
    owner = json['owner'];
    creationTime = json['created'];
    lastTriggered = json['lasttriggered'];
    timesTriggered = json['timestriggered'];
    status = json['status'];
    recycle = json['recycle'];
    conditions = [];
    for (Map<String, dynamic> item in json['conditions']) {
      conditions.add(new Condition.fromJsonManually(item));
    }
    actions = [];
    for (Map<String, dynamic> item in json['actions']) {
      actions.add(new Action.fromJsonManually(item));
    }
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable()
class Condition extends Object with _$ConditionSerializerMixin {
  String address;
  String operator;
  String value;

  Condition();

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

  Condition.fromJsonManually(Map<String, dynamic> json) {
    address = json['address'];
    operator = json['operator'];
    value = json['value'];
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable()
class Action extends Object with _$ActionSerializerMixin {
  String address;
  String method;
  Map<String, dynamic> body;

  Action();

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Action.fromJsonManually(Map<String, dynamic> json) {
    address = json['address'];
    method = json['method'];
    body = json['body'];
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
