// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return new Rule()
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
        ?.map((e) => e == null
            ? null
            : new RuleAction.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..recycle = json['recycle'] as bool;
}

abstract class _$RuleSerializerMixin {
  String get name;
  String get lastTriggered;
  String get creationTime;
  int get timesTriggered;
  String get owner;
  String get status;
  List<Condition> get conditions;
  List<RuleAction> get actions;
  bool get recycle;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'name': name,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('lasttriggered', lastTriggered);
    writeNotNull('creationtime', creationTime);
    writeNotNull('timestriggered', timesTriggered);
    writeNotNull('owner', owner);
    writeNotNull('status', status);
    writeNotNull('conditions', conditions);
    writeNotNull('actions', actions);
    writeNotNull('recycle', recycle);
    return val;
  }
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

RuleAction _$RuleActionFromJson(Map<String, dynamic> json) {
  return new RuleAction()
    ..address = json['address'] as String
    ..method = json['method'] as String
    ..body = json['body'] as Map<String, dynamic>;
}

abstract class _$RuleActionSerializerMixin {
  String get address;
  String get method;
  Map<String, dynamic> get body;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'address': address, 'method': method, 'body': body};
}
