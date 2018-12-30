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
  Iterable serialize(Serializers serializers, BridgeException object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(Object)));
    }

    return result;
  }

  @override
  BridgeException deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BridgeExceptionBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(Object));
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
  final Object type;

  factory _$BridgeException([void updates(BridgeExceptionBuilder b)]) =>
      (new BridgeExceptionBuilder()..update(updates)).build();

  _$BridgeException._({this.address, this.description, this.type}) : super._();

  @override
  BridgeException rebuild(void updates(BridgeExceptionBuilder b)) =>
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

  Object _type;
  Object get type => _$this._type;
  set type(Object type) => _$this._type = type;

  BridgeExceptionBuilder();

  BridgeExceptionBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address;
      _description = _$v.description;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BridgeException other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BridgeException;
  }

  @override
  void update(void updates(BridgeExceptionBuilder b)) {
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

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
