// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return new Rule()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..lastTriggered = json['lasttriggered'] as String
    ..creationTime = json['creationtime'] as String
    ..timesTriggered = json['timestriggered'] as int
    ..owner = json['owner'] as String
    ..status = json['status'] as String
    ..conditions = (json['conditions'] as List)
        ?.map((e) => e == null
            ? null
            : new Condition.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..actions = (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : new Action.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..recycle = json['recycle'] as bool;
}

abstract class _$RuleSerializerMixin {
  int get id;
  String get name;
  String get lastTriggered;
  String get creationTime;
  int get timesTriggered;
  String get owner;
  String get status;
  List<Condition> get conditions;
  List<Action> get actions;
  bool get recycle;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'lasttriggered': lastTriggered,
        'creationtime': creationTime,
        'timestriggered': timesTriggered,
        'owner': owner,
        'status': status,
        'conditions': conditions,
        'actions': actions,
        'recycle': recycle
      };
}

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return new Condition()
    ..address = json['address'] as String
    ..operator = json['operator'] as String
    ..value = json['value'] as String;
}

abstract class _$ConditionSerializerMixin {
  String get address;
  String get operator;
  String get value;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'operator': operator,
        'value': value
      };
}

Action _$ActionFromJson(Map<String, dynamic> json) {
  return new Action()
    ..address = json['address'] as String
    ..method = json['method'] as String
    ..body = json['body'] as Map<String, dynamic>;
}

abstract class _$ActionSerializerMixin {
  String get address;
  String get method;
  Map<String, dynamic> get body;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'address': address, 'method': method, 'body': body};
}
