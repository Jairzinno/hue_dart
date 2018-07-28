import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rule.g.dart';

@JsonSerializable()
class Rule extends Object with _$RuleSerializerMixin {
  @JsonKey(ignore: true)
  int id;

  /// Human readable name of the rule.
  String name;

  @JsonKey(name: 'lasttriggered', includeIfNull: false)
  String lastTriggered;

  DateTime get lastTriggeredDate =>
      new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastTriggered);

  @JsonKey(name: 'creationtime', includeIfNull: false)
  String creationTime;

  DateTime get creationTimeDate =>
      new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(creationTime);

  @JsonKey(name: 'timestriggered', includeIfNull: false)
  int timesTriggered;

  @JsonKey(includeIfNull: false)
  String owner;

  @JsonKey(includeIfNull: false)
  String status;

  @JsonKey(includeIfNull: false)
  List<Condition> conditions;

  @JsonKey(includeIfNull: false)
  List<RuleAction> actions;

  @JsonKey(includeIfNull: false)
  bool recycle;

  Rule();

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

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

  Condition.forAddress(this.address, this.operator, this.value);

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

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
class RuleAction extends Object with _$RuleActionSerializerMixin {
  String address;
  String method;
  Map<String, dynamic> body;

  RuleAction();

  RuleAction.forAddress(this.address, this.method, this.body);

  factory RuleAction.fromJson(Map<String, dynamic> json) =>
      _$RuleActionFromJson(json);

  RuleAction.fromJsonManually(Map<String, dynamic> json) {
    address = json['address'];
    method = json['method'];
    body = json['body'];
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
