// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BridgeException> _$bridgeExceptionSerializer =
    new _$BridgeExceptionSerializer();

class _$BridgeExceptionSerializer
    implements StructuredSerializer<BridgeException> {
  @override
  final Iterable<Type> types = const [BridgeException, _$BridgeException];
  @override
  final String wireName = 'BridgeException';

  @override
  Iterable<Object> serialize(Serializers serializers, BridgeException object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BridgeException deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BridgeExceptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BridgeException extends BridgeException {
  @override
  final String address;
  @override
  final String description;
  @override
  final int type;

  factory _$BridgeException([void Function(BridgeExceptionBuilder) updates]) =>
      (new BridgeExceptionBuilder()..update(updates)).build();

  _$BridgeException._({this.address, this.description, this.type}) : super._();

  @override
  BridgeException rebuild(void Function(BridgeExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BridgeExceptionBuilder toBuilder() =>
      new BridgeExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BridgeException &&
        address == other.address &&
        description == other.description &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, address.hashCode), description.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BridgeException')
          ..add('address', address)
          ..add('description', description)
          ..add('type', type))
        .toString();
  }
}

class BridgeExceptionBuilder
    implements Builder<BridgeException, BridgeExceptionBuilder> {
  _$BridgeException _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _type;
  int get type => _$this._type;
  set type(int type) => _$this._type = type;

  BridgeExceptionBuilder();

  BridgeExceptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _description = $v.description;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BridgeException other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BridgeException;
  }

  @override
  void update(void Function(BridgeExceptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BridgeException build() {
    final _$result = _$v ??
        new _$BridgeException._(
            address: address, description: description, type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
