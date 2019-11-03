// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Light> _$lightSerializer = new _$LightSerializer();

class _$LightSerializer implements StructuredSerializer<Light> {
  @override
  final Iterable<Type> types = const [Light, _$Light];
  @override
  final String wireName = 'Light';

  @override
  Iterable<Object> serialize(Serializers serializers, Light object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(LightState)));
    }
    if (object.modelId != null) {
      result
        ..add('modelid')
        ..add(serializers.serialize(object.modelId,
            specifiedType: const FullType(String)));
    }
    if (object.uniqueId != null) {
      result
        ..add('uniqueid')
        ..add(serializers.serialize(object.uniqueId,
            specifiedType: const FullType(String)));
    }
    if (object.manufacturerName != null) {
      result
        ..add('manufacturername')
        ..add(serializers.serialize(object.manufacturerName,
            specifiedType: const FullType(String)));
    }
    if (object.luminaireUniqueId != null) {
      result
        ..add('luminaireuniqueid')
        ..add(serializers.serialize(object.luminaireUniqueId,
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
  Light deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LightBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
              specifiedType: const FullType(LightState)) as LightState);
          break;
        case 'modelid':
          result.modelId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uniqueid':
          result.uniqueId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'manufacturername':
          result.manufacturerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'luminaireuniqueid':
          result.luminaireUniqueId = serializers.deserialize(value,
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

class _$Light extends Light {
  @override
  final int id;
  @override
  final String type;
  @override
  final String name;
  @override
  final LightState state;
  @override
  final String modelId;
  @override
  final String uniqueId;
  @override
  final String manufacturerName;
  @override
  final String luminaireUniqueId;
  @override
  final String swVersion;
  String __productName;
  HueColor __colors;
  LightModel __model;

  factory _$Light([void Function(LightBuilder) updates]) =>
      (new LightBuilder()..update(updates)).build();

  _$Light._(
      {this.id,
      this.type,
      this.name,
      this.state,
      this.modelId,
      this.uniqueId,
      this.manufacturerName,
      this.luminaireUniqueId,
      this.swVersion})
      : super._();

  @override
  String get productName => __productName ??= super.productName;

  @override
  HueColor get colors => __colors ??= super.colors;

  @override
  LightModel get model => __model ??= super.model;

  @override
  Light rebuild(void Function(LightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LightBuilder toBuilder() => new LightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Light &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        state == other.state &&
        modelId == other.modelId &&
        uniqueId == other.uniqueId &&
        manufacturerName == other.manufacturerName &&
        luminaireUniqueId == other.luminaireUniqueId &&
        swVersion == other.swVersion;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), type.hashCode),
                                name.hashCode),
                            state.hashCode),
                        modelId.hashCode),
                    uniqueId.hashCode),
                manufacturerName.hashCode),
            luminaireUniqueId.hashCode),
        swVersion.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Light')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('state', state)
          ..add('modelId', modelId)
          ..add('uniqueId', uniqueId)
          ..add('manufacturerName', manufacturerName)
          ..add('luminaireUniqueId', luminaireUniqueId)
          ..add('swVersion', swVersion))
        .toString();
  }
}

class LightBuilder implements Builder<Light, LightBuilder> {
  _$Light _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  LightStateBuilder _state;
  LightStateBuilder get state => _$this._state ??= new LightStateBuilder();
  set state(LightStateBuilder state) => _$this._state = state;

  String _modelId;
  String get modelId => _$this._modelId;
  set modelId(String modelId) => _$this._modelId = modelId;

  String _uniqueId;
  String get uniqueId => _$this._uniqueId;
  set uniqueId(String uniqueId) => _$this._uniqueId = uniqueId;

  String _manufacturerName;
  String get manufacturerName => _$this._manufacturerName;
  set manufacturerName(String manufacturerName) =>
      _$this._manufacturerName = manufacturerName;

  String _luminaireUniqueId;
  String get luminaireUniqueId => _$this._luminaireUniqueId;
  set luminaireUniqueId(String luminaireUniqueId) =>
      _$this._luminaireUniqueId = luminaireUniqueId;

  String _swVersion;
  String get swVersion => _$this._swVersion;
  set swVersion(String swVersion) => _$this._swVersion = swVersion;

  LightBuilder();

  LightBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _type = _$v.type;
      _name = _$v.name;
      _state = _$v.state?.toBuilder();
      _modelId = _$v.modelId;
      _uniqueId = _$v.uniqueId;
      _manufacturerName = _$v.manufacturerName;
      _luminaireUniqueId = _$v.luminaireUniqueId;
      _swVersion = _$v.swVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Light other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Light;
  }

  @override
  void update(void Function(LightBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Light build() {
    _$Light _$result;
    try {
      _$result = _$v ??
          new _$Light._(
              id: id,
              type: type,
              name: name,
              state: _state?.build(),
              modelId: modelId,
              uniqueId: uniqueId,
              manufacturerName: manufacturerName,
              luminaireUniqueId: luminaireUniqueId,
              swVersion: swVersion);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'state';
        _state?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Light', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
