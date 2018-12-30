// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SensorState> _$sensorStateSerializer = new _$SensorStateSerializer();

class _$SensorStateSerializer implements StructuredSerializer<SensorState> {
  @override
  final Iterable<Type> types = const [SensorState, _$SensorState];
  @override
  final String wireName = 'SensorState';

  @override
  Iterable serialize(Serializers serializers, SensorState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.presence != null) {
      result
        ..add('presence')
        ..add(serializers.serialize(object.presence,
            specifiedType: const FullType(bool)));
    }
    if (object.lastUpdated != null) {
      result
        ..add('lastupdated')
        ..add(serializers.serialize(object.lastUpdated,
            specifiedType: const FullType(String)));
    }
    if (object.temperature != null) {
      result
        ..add('temperature')
        ..add(serializers.serialize(object.temperature,
            specifiedType: const FullType(int)));
    }
    if (object.buttonEvent != null) {
      result
        ..add('buttonevent')
        ..add(serializers.serialize(object.buttonEvent,
            specifiedType: const FullType(int)));
    }
    if (object.daylight != null) {
      result
        ..add('daylight')
        ..add(serializers.serialize(object.daylight,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  SensorState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SensorStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'presence':
          result.presence = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lastupdated':
          result.lastUpdated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'temperature':
          result.temperature = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'buttonevent':
          result.buttonEvent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'daylight':
          result.daylight = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SensorState extends SensorState {
  @override
  final bool presence;
  @override
  final String lastUpdated;
  @override
  final int temperature;
  @override
  final int buttonEvent;
  @override
  final String daylight;

  factory _$SensorState([void updates(SensorStateBuilder b)]) =>
      (new SensorStateBuilder()..update(updates)).build();

  _$SensorState._(
      {this.presence,
      this.lastUpdated,
      this.temperature,
      this.buttonEvent,
      this.daylight})
      : super._();

  @override
  SensorState rebuild(void updates(SensorStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SensorStateBuilder toBuilder() => new SensorStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorState &&
        presence == other.presence &&
        lastUpdated == other.lastUpdated &&
        temperature == other.temperature &&
        buttonEvent == other.buttonEvent &&
        daylight == other.daylight;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, presence.hashCode), lastUpdated.hashCode),
                temperature.hashCode),
            buttonEvent.hashCode),
        daylight.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SensorState')
          ..add('presence', presence)
          ..add('lastUpdated', lastUpdated)
          ..add('temperature', temperature)
          ..add('buttonEvent', buttonEvent)
          ..add('daylight', daylight))
        .toString();
  }
}

class SensorStateBuilder implements Builder<SensorState, SensorStateBuilder> {
  _$SensorState _$v;

  bool _presence;
  bool get presence => _$this._presence;
  set presence(bool presence) => _$this._presence = presence;

  String _lastUpdated;
  String get lastUpdated => _$this._lastUpdated;
  set lastUpdated(String lastUpdated) => _$this._lastUpdated = lastUpdated;

  int _temperature;
  int get temperature => _$this._temperature;
  set temperature(int temperature) => _$this._temperature = temperature;

  int _buttonEvent;
  int get buttonEvent => _$this._buttonEvent;
  set buttonEvent(int buttonEvent) => _$this._buttonEvent = buttonEvent;

  String _daylight;
  String get daylight => _$this._daylight;
  set daylight(String daylight) => _$this._daylight = daylight;

  SensorStateBuilder();

  SensorStateBuilder get _$this {
    if (_$v != null) {
      _presence = _$v.presence;
      _lastUpdated = _$v.lastUpdated;
      _temperature = _$v.temperature;
      _buttonEvent = _$v.buttonEvent;
      _daylight = _$v.daylight;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SensorState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SensorState;
  }

  @override
  void update(void updates(SensorStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SensorState build() {
    final _$result = _$v ??
        new _$SensorState._(
            presence: presence,
            lastUpdated: lastUpdated,
            temperature: temperature,
            buttonEvent: buttonEvent,
            daylight: daylight);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
