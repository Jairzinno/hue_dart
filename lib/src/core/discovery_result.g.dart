// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DiscoveryResult> _$discoveryResultSerializer =
    new _$DiscoveryResultSerializer();

class _$DiscoveryResultSerializer
    implements StructuredSerializer<DiscoveryResult> {
  @override
  final Iterable<Type> types = const [DiscoveryResult, _$DiscoveryResult];
  @override
  final String wireName = 'DiscoveryResult';

  @override
  Iterable serialize(Serializers serializers, DiscoveryResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.mac != null) {
      result
        ..add('mac')
        ..add(serializers.serialize(object.mac,
            specifiedType: const FullType(String)));
    }
    if (object.apiVersion != null) {
      result
        ..add('apiversion')
        ..add(serializers.serialize(object.apiVersion,
            specifiedType: const FullType(String)));
    }
    if (object.ipAddress != null) {
      result
        ..add('internalipaddress')
        ..add(serializers.serialize(object.ipAddress,
            specifiedType: const FullType(String)));
    }
    if (object.swVersion != null) {
      result
        ..add('swversion')
        ..add(serializers.serialize(object.swVersion,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  DiscoveryResult deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiscoveryResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mac':
          result.mac = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'apiversion':
          result.apiVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'internalipaddress':
          result.ipAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'swversion':
          result.swVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DiscoveryResult extends DiscoveryResult {
  @override
  final String id;
  @override
  final String name;
  @override
  final String mac;
  @override
  final String apiVersion;
  @override
  final String ipAddress;
  @override
  final String swVersion;

  factory _$DiscoveryResult([void updates(DiscoveryResultBuilder b)]) =>
      (new DiscoveryResultBuilder()..update(updates)).build();

  _$DiscoveryResult._(
      {this.id,
      this.name,
      this.mac,
      this.apiVersion,
      this.ipAddress,
      this.swVersion})
      : super._();

  @override
  DiscoveryResult rebuild(void updates(DiscoveryResultBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DiscoveryResultBuilder toBuilder() =>
      new DiscoveryResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiscoveryResult &&
        id == other.id &&
        name == other.name &&
        mac == other.mac &&
        apiVersion == other.apiVersion &&
        ipAddress == other.ipAddress &&
        swVersion == other.swVersion;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), mac.hashCode),
                apiVersion.hashCode),
            ipAddress.hashCode),
        swVersion.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiscoveryResult')
          ..add('id', id)
          ..add('name', name)
          ..add('mac', mac)
          ..add('apiVersion', apiVersion)
          ..add('ipAddress', ipAddress)
          ..add('swVersion', swVersion))
        .toString();
  }
}

class DiscoveryResultBuilder
    implements Builder<DiscoveryResult, DiscoveryResultBuilder> {
  _$DiscoveryResult _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _mac;
  String get mac => _$this._mac;
  set mac(String mac) => _$this._mac = mac;

  String _apiVersion;
  String get apiVersion => _$this._apiVersion;
  set apiVersion(String apiVersion) => _$this._apiVersion = apiVersion;

  String _ipAddress;
  String get ipAddress => _$this._ipAddress;
  set ipAddress(String ipAddress) => _$this._ipAddress = ipAddress;

  String _swVersion;
  String get swVersion => _$this._swVersion;
  set swVersion(String swVersion) => _$this._swVersion = swVersion;

  DiscoveryResultBuilder();

  DiscoveryResultBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _mac = _$v.mac;
      _apiVersion = _$v.apiVersion;
      _ipAddress = _$v.ipAddress;
      _swVersion = _$v.swVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiscoveryResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiscoveryResult;
  }

  @override
  void update(void updates(DiscoveryResultBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DiscoveryResult build() {
    final _$result = _$v ??
        new _$DiscoveryResult._(
            id: id,
            name: name,
            mac: mac,
            apiVersion: apiVersion,
            ipAddress: ipAddress,
            swVersion: swVersion);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
