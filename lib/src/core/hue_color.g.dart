// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hue_color.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HueColor> _$hueColorSerializer = new _$HueColorSerializer();

class _$HueColorSerializer implements StructuredSerializer<HueColor> {
  @override
  final Iterable<Type> types = const [HueColor, _$HueColor];
  @override
  final String wireName = 'HueColor';

  @override
  Iterable serialize(Serializers serializers, HueColor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.hue != null) {
      result
        ..add('hue')
        ..add(serializers.serialize(object.hue,
            specifiedType: const FullType(num)));
    }
    if (object.saturation != null) {
      result
        ..add('saturation')
        ..add(serializers.serialize(object.saturation,
            specifiedType: const FullType(num)));
    }
    if (object.brightness != null) {
      result
        ..add('brightness')
        ..add(serializers.serialize(object.brightness,
            specifiedType: const FullType(num)));
    }
    if (object.temperature != null) {
      result
        ..add('temperature')
        ..add(serializers.serialize(object.temperature,
            specifiedType: const FullType(num)));
    }
    if (object.ct != null) {
      result
        ..add('ct')
        ..add(serializers.serialize(object.ct,
            specifiedType: const FullType(num)));
    }
    if (object.xy != null) {
      result
        ..add('xy')
        ..add(serializers.serialize(object.xy,
            specifiedType:
                const FullType(BuiltList, const [const FullType(num)])));
    }
    if (object.red != null) {
      result
        ..add('red')
        ..add(serializers.serialize(object.red,
            specifiedType: const FullType(num)));
    }
    if (object.green != null) {
      result
        ..add('green')
        ..add(serializers.serialize(object.green,
            specifiedType: const FullType(num)));
    }
    if (object.blue != null) {
      result
        ..add('blue')
        ..add(serializers.serialize(object.blue,
            specifiedType: const FullType(num)));
    }

    return result;
  }

  @override
  HueColor deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HueColorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hue':
          result.hue = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'saturation':
          result.saturation = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'brightness':
          result.brightness = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'temperature':
          result.temperature = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'ct':
          result.ct = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'xy':
          result.xy.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(num)]))
              as BuiltList);
          break;
        case 'red':
          result.red = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'green':
          result.green = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'blue':
          result.blue = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
      }
    }

    return result.build();
  }
}

class _$HueColor extends HueColor {
  @override
  final num hue;
  @override
  final num saturation;
  @override
  final num brightness;
  @override
  final num temperature;
  @override
  final num ct;
  @override
  final BuiltList<num> xy;
  @override
  final num red;
  @override
  final num green;
  @override
  final num blue;

  factory _$HueColor([void updates(HueColorBuilder b)]) =>
      (new HueColorBuilder()..update(updates)).build();

  _$HueColor._(
      {this.hue,
      this.saturation,
      this.brightness,
      this.temperature,
      this.ct,
      this.xy,
      this.red,
      this.green,
      this.blue})
      : super._();

  @override
  HueColor rebuild(void updates(HueColorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  HueColorBuilder toBuilder() => new HueColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HueColor &&
        hue == other.hue &&
        saturation == other.saturation &&
        brightness == other.brightness &&
        temperature == other.temperature &&
        ct == other.ct &&
        xy == other.xy &&
        red == other.red &&
        green == other.green &&
        blue == other.blue;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, hue.hashCode), saturation.hashCode),
                                brightness.hashCode),
                            temperature.hashCode),
                        ct.hashCode),
                    xy.hashCode),
                red.hashCode),
            green.hashCode),
        blue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HueColor')
          ..add('hue', hue)
          ..add('saturation', saturation)
          ..add('brightness', brightness)
          ..add('temperature', temperature)
          ..add('ct', ct)
          ..add('xy', xy)
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class HueColorBuilder implements Builder<HueColor, HueColorBuilder> {
  _$HueColor _$v;

  num _hue;
  num get hue => _$this._hue;
  set hue(num hue) => _$this._hue = hue;

  num _saturation;
  num get saturation => _$this._saturation;
  set saturation(num saturation) => _$this._saturation = saturation;

  num _brightness;
  num get brightness => _$this._brightness;
  set brightness(num brightness) => _$this._brightness = brightness;

  num _temperature;
  num get temperature => _$this._temperature;
  set temperature(num temperature) => _$this._temperature = temperature;

  num _ct;
  num get ct => _$this._ct;
  set ct(num ct) => _$this._ct = ct;

  ListBuilder<num> _xy;
  ListBuilder<num> get xy => _$this._xy ??= new ListBuilder<num>();
  set xy(ListBuilder<num> xy) => _$this._xy = xy;

  num _red;
  num get red => _$this._red;
  set red(num red) => _$this._red = red;

  num _green;
  num get green => _$this._green;
  set green(num green) => _$this._green = green;

  num _blue;
  num get blue => _$this._blue;
  set blue(num blue) => _$this._blue = blue;

  HueColorBuilder();

  HueColorBuilder get _$this {
    if (_$v != null) {
      _hue = _$v.hue;
      _saturation = _$v.saturation;
      _brightness = _$v.brightness;
      _temperature = _$v.temperature;
      _ct = _$v.ct;
      _xy = _$v.xy?.toBuilder();
      _red = _$v.red;
      _green = _$v.green;
      _blue = _$v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HueColor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HueColor;
  }

  @override
  void update(void updates(HueColorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$HueColor build() {
    _$HueColor _$result;
    try {
      _$result = _$v ??
          new _$HueColor._(
              hue: hue,
              saturation: saturation,
              brightness: brightness,
              temperature: temperature,
              ct: ct,
              xy: _xy?.build(),
              red: red,
              green: green,
              blue: blue);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'xy';
        _xy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HueColor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
