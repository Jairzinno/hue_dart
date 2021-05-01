// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_update_bridge.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SoftwareUpdateBridge> _$softwareUpdateBridgeSerializer =
    new _$SoftwareUpdateBridgeSerializer();

class _$SoftwareUpdateBridgeSerializer
    implements StructuredSerializer<SoftwareUpdateBridge> {
  @override
  final Iterable<Type> types = const [
    SoftwareUpdateBridge,
    _$SoftwareUpdateBridge
  ];
  @override
  final String wireName = 'SoftwareUpdateBridge';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SoftwareUpdateBridge object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'lastinstall',
      serializers.serialize(object.lastInstall,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SoftwareUpdateBridge deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SoftwareUpdateBridgeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastinstall':
          result.lastInstall = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SoftwareUpdateBridge extends SoftwareUpdateBridge {
  @override
  final String state;
  @override
  final String lastInstall;
  DateTime __lastInstallDate;

  factory _$SoftwareUpdateBridge(
          [void Function(SoftwareUpdateBridgeBuilder) updates]) =>
      (new SoftwareUpdateBridgeBuilder()..update(updates)).build();

  _$SoftwareUpdateBridge._({this.state, this.lastInstall}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        state, 'SoftwareUpdateBridge', 'state');
    BuiltValueNullFieldError.checkNotNull(
        lastInstall, 'SoftwareUpdateBridge', 'lastInstall');
  }

  @override
  DateTime get lastInstallDate => __lastInstallDate ??= super.lastInstallDate;

  @override
  SoftwareUpdateBridge rebuild(
          void Function(SoftwareUpdateBridgeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SoftwareUpdateBridgeBuilder toBuilder() =>
      new SoftwareUpdateBridgeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SoftwareUpdateBridge &&
        state == other.state &&
        lastInstall == other.lastInstall;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, state.hashCode), lastInstall.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SoftwareUpdateBridge')
          ..add('state', state)
          ..add('lastInstall', lastInstall))
        .toString();
  }
}

class SoftwareUpdateBridgeBuilder
    implements Builder<SoftwareUpdateBridge, SoftwareUpdateBridgeBuilder> {
  _$SoftwareUpdateBridge _$v;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  String _lastInstall;
  String get lastInstall => _$this._lastInstall;
  set lastInstall(String lastInstall) => _$this._lastInstall = lastInstall;

  SoftwareUpdateBridgeBuilder();

  SoftwareUpdateBridgeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _lastInstall = $v.lastInstall;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SoftwareUpdateBridge other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SoftwareUpdateBridge;
  }

  @override
  void update(void Function(SoftwareUpdateBridgeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SoftwareUpdateBridge build() {
    final _$result = _$v ??
        new _$SoftwareUpdateBridge._(
            state: BuiltValueNullFieldError.checkNotNull(
                state, 'SoftwareUpdateBridge', 'state'),
            lastInstall: BuiltValueNullFieldError.checkNotNull(
                lastInstall, 'SoftwareUpdateBridge', 'lastInstall'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
