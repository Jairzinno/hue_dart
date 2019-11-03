// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SoftwareUpdate> _$softwareUpdateSerializer =
    new _$SoftwareUpdateSerializer();

class _$SoftwareUpdateSerializer
    implements StructuredSerializer<SoftwareUpdate> {
  @override
  final Iterable<Type> types = const [SoftwareUpdate, _$SoftwareUpdate];
  @override
  final String wireName = 'SoftwareUpdate';

  @override
  Iterable<Object> serialize(Serializers serializers, SoftwareUpdate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.checkForUpdate != null) {
      result
        ..add('checkforupdate')
        ..add(serializers.serialize(object.checkForUpdate,
            specifiedType: const FullType(bool)));
    }
    if (object.lastChange != null) {
      result
        ..add('lastchange')
        ..add(serializers.serialize(object.lastChange,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(String)));
    }
    if (object.bridge != null) {
      result
        ..add('bridge')
        ..add(serializers.serialize(object.bridge,
            specifiedType: const FullType(SoftwareUpdateBridge)));
    }
    if (object.autoInstall != null) {
      result
        ..add('autoinstall')
        ..add(serializers.serialize(object.autoInstall,
            specifiedType: const FullType(AutoInstall)));
    }
    return result;
  }

  @override
  SoftwareUpdate deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SoftwareUpdateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'checkforupdate':
          result.checkForUpdate = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lastchange':
          result.lastChange = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bridge':
          result.bridge.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SoftwareUpdateBridge))
              as SoftwareUpdateBridge);
          break;
        case 'autoinstall':
          result.autoInstall.replace(serializers.deserialize(value,
              specifiedType: const FullType(AutoInstall)) as AutoInstall);
          break;
      }
    }

    return result.build();
  }
}

class _$SoftwareUpdate extends SoftwareUpdate {
  @override
  final bool checkForUpdate;
  @override
  final String lastChange;
  @override
  final String state;
  @override
  final SoftwareUpdateBridge bridge;
  @override
  final AutoInstall autoInstall;

  factory _$SoftwareUpdate([void Function(SoftwareUpdateBuilder) updates]) =>
      (new SoftwareUpdateBuilder()..update(updates)).build();

  _$SoftwareUpdate._(
      {this.checkForUpdate,
      this.lastChange,
      this.state,
      this.bridge,
      this.autoInstall})
      : super._();

  @override
  SoftwareUpdate rebuild(void Function(SoftwareUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SoftwareUpdateBuilder toBuilder() =>
      new SoftwareUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SoftwareUpdate &&
        checkForUpdate == other.checkForUpdate &&
        lastChange == other.lastChange &&
        state == other.state &&
        bridge == other.bridge &&
        autoInstall == other.autoInstall;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, checkForUpdate.hashCode), lastChange.hashCode),
                state.hashCode),
            bridge.hashCode),
        autoInstall.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SoftwareUpdate')
          ..add('checkForUpdate', checkForUpdate)
          ..add('lastChange', lastChange)
          ..add('state', state)
          ..add('bridge', bridge)
          ..add('autoInstall', autoInstall))
        .toString();
  }
}

class SoftwareUpdateBuilder
    implements Builder<SoftwareUpdate, SoftwareUpdateBuilder> {
  _$SoftwareUpdate _$v;

  bool _checkForUpdate;
  bool get checkForUpdate => _$this._checkForUpdate;
  set checkForUpdate(bool checkForUpdate) =>
      _$this._checkForUpdate = checkForUpdate;

  String _lastChange;
  String get lastChange => _$this._lastChange;
  set lastChange(String lastChange) => _$this._lastChange = lastChange;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  SoftwareUpdateBridgeBuilder _bridge;
  SoftwareUpdateBridgeBuilder get bridge =>
      _$this._bridge ??= new SoftwareUpdateBridgeBuilder();
  set bridge(SoftwareUpdateBridgeBuilder bridge) => _$this._bridge = bridge;

  AutoInstallBuilder _autoInstall;
  AutoInstallBuilder get autoInstall =>
      _$this._autoInstall ??= new AutoInstallBuilder();
  set autoInstall(AutoInstallBuilder autoInstall) =>
      _$this._autoInstall = autoInstall;

  SoftwareUpdateBuilder();

  SoftwareUpdateBuilder get _$this {
    if (_$v != null) {
      _checkForUpdate = _$v.checkForUpdate;
      _lastChange = _$v.lastChange;
      _state = _$v.state;
      _bridge = _$v.bridge?.toBuilder();
      _autoInstall = _$v.autoInstall?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SoftwareUpdate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SoftwareUpdate;
  }

  @override
  void update(void Function(SoftwareUpdateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SoftwareUpdate build() {
    _$SoftwareUpdate _$result;
    try {
      _$result = _$v ??
          new _$SoftwareUpdate._(
              checkForUpdate: checkForUpdate,
              lastChange: lastChange,
              state: state,
              bridge: _bridge?.build(),
              autoInstall: _autoInstall?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bridge';
        _bridge?.build();
        _$failedField = 'autoInstall';
        _autoInstall?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SoftwareUpdate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
