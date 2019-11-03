// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LightState> _$lightStateSerializer = new _$LightStateSerializer();

class _$LightStateSerializer implements StructuredSerializer<LightState> {
  @override
  final Iterable<Type> types = const [LightState, _$LightState];
  @override
  final String wireName = 'LightState';

  @override
  Iterable<Object> serialize(Serializers serializers, LightState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.on != null) {
      result
        ..add('on')
        ..add(serializers.serialize(object.on,
            specifiedType: const FullType(bool)));
    }
    if (object.brightness != null) {
      result
        ..add('bri')
        ..add(serializers.serialize(object.brightness,
            specifiedType: const FullType(int)));
    }
    if (object.hue != null) {
      result
        ..add('hue')
        ..add(serializers.serialize(object.hue,
            specifiedType: const FullType(int)));
    }
    if (object.saturation != null) {
      result
        ..add('sat')
        ..add(serializers.serialize(object.saturation,
            specifiedType: const FullType(int)));
    }
    if (object.xy != null) {
      result
        ..add('xy')
        ..add(serializers.serialize(object.xy,
            specifiedType:
                const FullType(BuiltList, const [const FullType(num)])));
    }
    if (object.ct != null) {
      result
        ..add('ct')
        ..add(serializers.serialize(object.ct,
            specifiedType: const FullType(int)));
    }
    if (object.alert != null) {
      result
        ..add('alert')
        ..add(serializers.serialize(object.alert,
            specifiedType: const FullType(String)));
    }
    if (object.effect != null) {
      result
        ..add('effect')
        ..add(serializers.serialize(object.effect,
            specifiedType: const FullType(String)));
    }
    if (object.colorMode != null) {
      result
        ..add('colormode')
        ..add(serializers.serialize(object.colorMode,
            specifiedType: const FullType(String)));
    }
    if (object.reachable != null) {
      result
        ..add('reachable')
        ..add(serializers.serialize(object.reachable,
            specifiedType: const FullType(bool)));
    }
    if (object.mode != null) {
      result
        ..add('mode')
        ..add(serializers.serialize(object.mode,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LightState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LightStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'on':
          result.on = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'bri':
          result.brightness = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hue':
          result.hue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sat':
          result.saturation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'xy':
          result.xy.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(num)]))
              as BuiltList<dynamic>);
          break;
        case 'ct':
          result.ct = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'alert':
          result.alert = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'effect':
          result.effect = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'colormode':
          result.colorMode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reachable':
          result.reachable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'mode':
          result.mode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LightState extends LightState {
  @override
  final bool on;
  @override
  final int brightness;
  @override
  final int hue;
  @override
  final int saturation;
  @override
  final BuiltList<num> xy;
  @override
  final int ct;
  @override
  final String alert;
  @override
  final String effect;
  @override
  final String colorMode;
  @override
  final bool reachable;
  @override
  final String mode;

  factory _$LightState([void Function(LightStateBuilder) updates]) =>
      (new LightStateBuilder()..update(updates)).build();

  _$LightState._(
      {this.on,
      this.brightness,
      this.hue,
      this.saturation,
      this.xy,
      this.ct,
      this.alert,
      this.effect,
      this.colorMode,
      this.reachable,
      this.mode})
      : super._();

  @override
  LightState rebuild(void Function(LightStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LightStateBuilder toBuilder() => new LightStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LightState &&
        on == other.on &&
        brightness == other.brightness &&
        hue == other.hue &&
        saturation == other.saturation &&
        xy == other.xy &&
        ct == other.ct &&
        alert == other.alert &&
        effect == other.effect &&
        colorMode == other.colorMode &&
        reachable == other.reachable &&
        mode == other.mode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, on.hashCode),
                                            brightness.hashCode),
                                        hue.hashCode),
                                    saturation.hashCode),
                                xy.hashCode),
                            ct.hashCode),
                        alert.hashCode),
                    effect.hashCode),
                colorMode.hashCode),
            reachable.hashCode),
        mode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LightState')
          ..add('on', on)
          ..add('brightness', brightness)
          ..add('hue', hue)
          ..add('saturation', saturation)
          ..add('xy', xy)
          ..add('ct', ct)
          ..add('alert', alert)
          ..add('effect', effect)
          ..add('colorMode', colorMode)
          ..add('reachable', reachable)
          ..add('mode', mode))
        .toString();
  }
}

class LightStateBuilder implements Builder<LightState, LightStateBuilder> {
  _$LightState _$v;

  bool _on;
  bool get on => _$this._on;
  set on(bool on) => _$this._on = on;

  int _brightness;
  int get brightness => _$this._brightness;
  set brightness(int brightness) => _$this._brightness = brightness;

  int _hue;
  int get hue => _$this._hue;
  set hue(int hue) => _$this._hue = hue;

  int _saturation;
  int get saturation => _$this._saturation;
  set saturation(int saturation) => _$this._saturation = saturation;

  ListBuilder<num> _xy;
  ListBuilder<num> get xy => _$this._xy ??= new ListBuilder<num>();
  set xy(ListBuilder<num> xy) => _$this._xy = xy;

  int _ct;
  int get ct => _$this._ct;
  set ct(int ct) => _$this._ct = ct;

  String _alert;
  String get alert => _$this._alert;
  set alert(String alert) => _$this._alert = alert;

  String _effect;
  String get effect => _$this._effect;
  set effect(String effect) => _$this._effect = effect;

  String _colorMode;
  String get colorMode => _$this._colorMode;
  set colorMode(String colorMode) => _$this._colorMode = colorMode;

  bool _reachable;
  bool get reachable => _$this._reachable;
  set reachable(bool reachable) => _$this._reachable = reachable;

  String _mode;
  String get mode => _$this._mode;
  set mode(String mode) => _$this._mode = mode;

  LightStateBuilder();

  LightStateBuilder get _$this {
    if (_$v != null) {
      _on = _$v.on;
      _brightness = _$v.brightness;
      _hue = _$v.hue;
      _saturation = _$v.saturation;
      _xy = _$v.xy?.toBuilder();
      _ct = _$v.ct;
      _alert = _$v.alert;
      _effect = _$v.effect;
      _colorMode = _$v.colorMode;
      _reachable = _$v.reachable;
      _mode = _$v.mode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LightState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LightState;
  }

  @override
  void update(void Function(LightStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LightState build() {
    _$LightState _$result;
    try {
      _$result = _$v ??
          new _$LightState._(
              on: on,
              brightness: brightness,
              hue: hue,
              saturation: saturation,
              xy: _xy?.build(),
              ct: ct,
              alert: alert,
              effect: effect,
              colorMode: colorMode,
              reachable: reachable,
              mode: mode);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'xy';
        _xy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LightState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
