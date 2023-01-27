// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupState> _$groupStateSerializer = new _$GroupStateSerializer();

class _$GroupStateSerializer implements StructuredSerializer<GroupState> {
  @override
  final Iterable<Type> types = const [GroupState, _$GroupState];
  @override
  final String wireName = 'GroupState';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupState object,
      {FullType specifiedType = FullType.unspecified,}) {
    final result = <Object?>[];
    Object? value;
    value = object.anyOn;
    if (value != null) {
      result
        ..add('any_on')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)),);
    }
    value = object.allOn;
    if (value != null) {
      result
        ..add('all_on')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)),);
    }
    return result;
  }

  @override
  GroupState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified,}) {
    final result = new GroupStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'any_on':
          result.anyOn = serializers.deserialize(value,
              specifiedType: const FullType(bool),) as bool;
          break;
        case 'all_on':
          result.allOn = serializers.deserialize(value,
              specifiedType: const FullType(bool),) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GroupState extends GroupState {
  @override
  final bool? anyOn;
  @override
  final bool? allOn;

  factory _$GroupState([void Function(GroupStateBuilder)? updates]) =>
      (new GroupStateBuilder()..update(updates)).build();

  _$GroupState._({this.anyOn, this.allOn}) : super._();

  @override
  GroupState rebuild(void Function(GroupStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupStateBuilder toBuilder() => new GroupStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupState && anyOn == other.anyOn && allOn == other.allOn;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anyOn.hashCode), allOn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupState')
          ..add('anyOn', anyOn)
          ..add('allOn', allOn))
        .toString();
  }
}

class GroupStateBuilder implements Builder<GroupState, GroupStateBuilder> {
  _$GroupState? _$v;

  bool? _anyOn;
  bool? get anyOn => _$this._anyOn;
  set anyOn(bool? anyOn) => _$this._anyOn = anyOn;

  bool? _allOn;
  bool? get allOn => _$this._allOn;
  set allOn(bool? allOn) => _$this._allOn = allOn;

  GroupStateBuilder();

  GroupStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anyOn = $v.anyOn;
      _allOn = $v.allOn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupState;
  }

  @override
  void update(void Function(GroupStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupState build() {
    final $result = _$v ?? new _$GroupState._(anyOn: anyOn, allOn: allOn);
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
