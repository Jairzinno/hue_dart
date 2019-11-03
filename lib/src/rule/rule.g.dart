// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Rule> _$ruleSerializer = new _$RuleSerializer();

class _$RuleSerializer implements StructuredSerializer<Rule> {
  @override
  final Iterable<Type> types = const [Rule, _$Rule];
  @override
  final String wireName = 'Rule';

  @override
  Iterable<Object> serialize(Serializers serializers, Rule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.lastTriggered != null) {
      result
        ..add('lasttriggered')
        ..add(serializers.serialize(object.lastTriggered,
            specifiedType: const FullType(String)));
    }
    if (object.creationTime != null) {
      result
        ..add('creationtime')
        ..add(serializers.serialize(object.creationTime,
            specifiedType: const FullType(String)));
    }
    if (object.timesTriggered != null) {
      result
        ..add('timestriggered')
        ..add(serializers.serialize(object.timesTriggered,
            specifiedType: const FullType(int)));
    }
    if (object.owner != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(object.owner,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.conditions != null) {
      result
        ..add('conditions')
        ..add(serializers.serialize(object.conditions,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Condition)])));
    }
    if (object.actions != null) {
      result
        ..add('actions')
        ..add(serializers.serialize(object.actions,
            specifiedType:
                const FullType(BuiltList, const [const FullType(RuleAction)])));
    }
    if (object.recycle != null) {
      result
        ..add('recycle')
        ..add(serializers.serialize(object.recycle,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  Rule deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RuleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lasttriggered':
          result.lastTriggered = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'creationtime':
          result.creationTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestriggered':
          result.timesTriggered = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'conditions':
          result.conditions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Condition)]))
              as BuiltList<dynamic>);
          break;
        case 'actions':
          result.actions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RuleAction)]))
              as BuiltList<dynamic>);
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Rule extends Rule {
  @override
  final int id;
  @override
  final String name;
  @override
  final String lastTriggered;
  @override
  final String creationTime;
  @override
  final int timesTriggered;
  @override
  final String owner;
  @override
  final String status;
  @override
  final BuiltList<Condition> conditions;
  @override
  final BuiltList<RuleAction> actions;
  @override
  final bool recycle;

  factory _$Rule([void Function(RuleBuilder) updates]) =>
      (new RuleBuilder()..update(updates)).build();

  _$Rule._(
      {this.id,
      this.name,
      this.lastTriggered,
      this.creationTime,
      this.timesTriggered,
      this.owner,
      this.status,
      this.conditions,
      this.actions,
      this.recycle})
      : super._();

  @override
  Rule rebuild(void Function(RuleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RuleBuilder toBuilder() => new RuleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Rule &&
        id == other.id &&
        name == other.name &&
        lastTriggered == other.lastTriggered &&
        creationTime == other.creationTime &&
        timesTriggered == other.timesTriggered &&
        owner == other.owner &&
        status == other.status &&
        conditions == other.conditions &&
        actions == other.actions &&
        recycle == other.recycle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, id.hashCode), name.hashCode),
                                    lastTriggered.hashCode),
                                creationTime.hashCode),
                            timesTriggered.hashCode),
                        owner.hashCode),
                    status.hashCode),
                conditions.hashCode),
            actions.hashCode),
        recycle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Rule')
          ..add('id', id)
          ..add('name', name)
          ..add('lastTriggered', lastTriggered)
          ..add('creationTime', creationTime)
          ..add('timesTriggered', timesTriggered)
          ..add('owner', owner)
          ..add('status', status)
          ..add('conditions', conditions)
          ..add('actions', actions)
          ..add('recycle', recycle))
        .toString();
  }
}

class RuleBuilder implements Builder<Rule, RuleBuilder> {
  _$Rule _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _lastTriggered;
  String get lastTriggered => _$this._lastTriggered;
  set lastTriggered(String lastTriggered) =>
      _$this._lastTriggered = lastTriggered;

  String _creationTime;
  String get creationTime => _$this._creationTime;
  set creationTime(String creationTime) => _$this._creationTime = creationTime;

  int _timesTriggered;
  int get timesTriggered => _$this._timesTriggered;
  set timesTriggered(int timesTriggered) =>
      _$this._timesTriggered = timesTriggered;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  ListBuilder<Condition> _conditions;
  ListBuilder<Condition> get conditions =>
      _$this._conditions ??= new ListBuilder<Condition>();
  set conditions(ListBuilder<Condition> conditions) =>
      _$this._conditions = conditions;

  ListBuilder<RuleAction> _actions;
  ListBuilder<RuleAction> get actions =>
      _$this._actions ??= new ListBuilder<RuleAction>();
  set actions(ListBuilder<RuleAction> actions) => _$this._actions = actions;

  bool _recycle;
  bool get recycle => _$this._recycle;
  set recycle(bool recycle) => _$this._recycle = recycle;

  RuleBuilder();

  RuleBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _lastTriggered = _$v.lastTriggered;
      _creationTime = _$v.creationTime;
      _timesTriggered = _$v.timesTriggered;
      _owner = _$v.owner;
      _status = _$v.status;
      _conditions = _$v.conditions?.toBuilder();
      _actions = _$v.actions?.toBuilder();
      _recycle = _$v.recycle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Rule other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Rule;
  }

  @override
  void update(void Function(RuleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Rule build() {
    _$Rule _$result;
    try {
      _$result = _$v ??
          new _$Rule._(
              id: id,
              name: name,
              lastTriggered: lastTriggered,
              creationTime: creationTime,
              timesTriggered: timesTriggered,
              owner: owner,
              status: status,
              conditions: _conditions?.build(),
              actions: _actions?.build(),
              recycle: recycle);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'conditions';
        _conditions?.build();
        _$failedField = 'actions';
        _actions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Rule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
