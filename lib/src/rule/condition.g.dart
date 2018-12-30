// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Condition> _$conditionSerializer = new _$ConditionSerializer();

class _$ConditionSerializer implements StructuredSerializer<Condition> {
  @override
  final Iterable<Type> types = const [Condition, _$Condition];
  @override
  final String wireName = 'Condition';

  @override
  Iterable serialize(Serializers serializers, Condition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.operator != null) {
      result
        ..add('operator')
        ..add(serializers.serialize(object.operator,
            specifiedType: const FullType(String)));
    }
    if (object.value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(object.value,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Condition deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConditionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'operator':
          result.operator = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Condition extends Condition {
  @override
  final String address;
  @override
  final String operator;
  @override
  final String value;

  factory _$Condition([void updates(ConditionBuilder b)]) =>
      (new ConditionBuilder()..update(updates)).build();

  _$Condition._({this.address, this.operator, this.value}) : super._();

  @override
  Condition rebuild(void updates(ConditionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ConditionBuilder toBuilder() => new ConditionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Condition &&
        address == other.address &&
        operator == other.operator &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, address.hashCode), operator.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Condition')
          ..add('address', address)
          ..add('operator', operator)
          ..add('value', value))
        .toString();
  }
}

class ConditionBuilder implements Builder<Condition, ConditionBuilder> {
  _$Condition _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _operator;
  String get operator => _$this._operator;
  set operator(String operator) => _$this._operator = operator;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  ConditionBuilder();

  ConditionBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address;
      _operator = _$v.operator;
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Condition other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Condition;
  }

  @override
  void update(void updates(ConditionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Condition build() {
    final _$result = _$v ??
        new _$Condition._(address: address, operator: operator, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
