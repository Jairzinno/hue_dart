// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SensorConfig> _$sensorConfigSerializer =
    new _$SensorConfigSerializer();

class _$SensorConfigSerializer implements StructuredSerializer<SensorConfig> {
  @override
  final Iterable<Type> types = const [SensorConfig, $SensorConfig];
  @override
  final String wireName = 'SensorConfig';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SensorConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.on;
    if (value != null) {
      result
        ..add('on')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }
    value = object.reachable;
    if (value != null) {
      result
        ..add('reachable')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }
    value = object.battery;
    if (value != null) {
      result
        ..add('battery')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  SensorConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new SensorConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'on':
          result.on = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          break;
        case 'reachable':
          result.reachable = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          break;
        case 'battery':
          result.battery = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          break;
      }
    }

    return result.build();
  }
}

class $SensorConfig extends SensorConfig {
  @override
  final bool? on;
  @override
  final bool? reachable;
  @override
  final int? battery;

  factory $SensorConfig([void Function(SensorConfigBuilder)? updates]) =>
      (new SensorConfigBuilder()..update(updates)).build();

  $SensorConfig._({this.on, this.reachable, this.battery}) : super._();

  @override
  SensorConfig rebuild(void Function(SensorConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SensorConfigBuilder toBuilder() => new SensorConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorConfig &&
        on == other.on &&
        reachable == other.reachable &&
        battery == other.battery;
  }

  @override
  int get hashCode {
    return $jf(
      $jc($jc($jc(0, on.hashCode), reachable.hashCode), battery.hashCode),
    );
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SensorConfig')
          ..add('on', on)
          ..add('reachable', reachable)
          ..add('battery', battery))
        .toString();
  }
}

class SensorConfigBuilder
    implements Builder<SensorConfig, SensorConfigBuilder> {
  $SensorConfig? _$v;

  bool? _on;
  bool? get on => _$this._on;
  set on(bool? on) => _$this._on = on;

  bool? _reachable;
  bool? get reachable => _$this._reachable;
  set reachable(bool? reachable) => _$this._reachable = reachable;

  int? _battery;
  int? get battery => _$this._battery;
  set battery(int? battery) => _$this._battery = battery;

  SensorConfigBuilder();

  SensorConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _on = $v.on;
      _reachable = $v.reachable;
      _battery = $v.battery;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SensorConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as $SensorConfig;
  }

  @override
  void update(void Function(SensorConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $SensorConfig build() {
    final $result = _$v ??
        new $SensorConfig._(on: on, reachable: reachable, battery: battery);
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
