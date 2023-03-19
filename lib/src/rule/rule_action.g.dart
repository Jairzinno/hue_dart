// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RuleAction> _$ruleActionSerializer = new _$RuleActionSerializer();

class _$RuleActionSerializer implements StructuredSerializer<RuleAction> {
  @override
  final Iterable<Type> types = const [RuleAction, $RuleAction];
  @override
  final String wireName = 'RuleAction';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    RuleAction object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.method;
    if (value != null) {
      result
        ..add('method')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.body;
    if (value != null) {
      result
        ..add('body')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(
              BuiltMap,
              const [const FullType(String), const FullType(String)],
            ),
          ),
        );
    }
    return result;
  }

  @override
  RuleAction deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new RuleActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'method':
          result.method = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'body':
          result.body.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(
                BuiltMap,
                const [const FullType(String), const FullType(String)],
              ),
            )!,
          );
          break;
      }
    }

    return result.build();
  }
}

class $RuleAction extends RuleAction {
  @override
  final String? address;
  @override
  final String? method;
  @override
  final BuiltMap<String, String>? body;

  factory $RuleAction([void Function(RuleActionBuilder)? updates]) =>
      (new RuleActionBuilder()..update(updates)).build();

  $RuleAction._({this.address, this.method, this.body}) : super._();

  @override
  RuleAction rebuild(void Function(RuleActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RuleActionBuilder toBuilder() => new RuleActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RuleAction &&
        address == other.address &&
        method == other.method &&
        body == other.body;
  }

  @override
  int get hashCode {
    return $jf(
      $jc($jc($jc(0, address.hashCode), method.hashCode), body.hashCode),
    );
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RuleAction')
          ..add('address', address)
          ..add('method', method)
          ..add('body', body))
        .toString();
  }
}

class RuleActionBuilder implements Builder<RuleAction, RuleActionBuilder> {
  $RuleAction? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  MapBuilder<String, String>? _body;
  MapBuilder<String, String> get body =>
      _$this._body ??= new MapBuilder<String, String>();
  set body(MapBuilder<String, String>? body) => _$this._body = body;

  RuleActionBuilder();

  RuleActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _method = $v.method;
      _body = $v.body?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RuleAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as $RuleAction;
  }

  @override
  void update(void Function(RuleActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $RuleAction build() {
    $RuleAction $result;
    try {
      $result = _$v ??
          new $RuleAction._(
            address: address,
            method: method,
            body: _body?.build(),
          );
    } catch (_) {
      late String $failedField;
      try {
        $failedField = 'body';
        _body?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          'RuleAction',
          $failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
