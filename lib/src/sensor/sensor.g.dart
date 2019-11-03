// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Sensor> _$sensorSerializer = new _$SensorSerializer();

class _$SensorSerializer implements StructuredSerializer<Sensor> {
  @override
  final Iterable<Type> types = const [Sensor, _$Sensor];
  @override
  final String wireName = 'Sensor';

  @override
  Iterable<Object> serialize(Serializers serializers, Sensor object,
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
    if (object.swVersion != null) {
      result
        ..add('swversion')
        ..add(serializers.serialize(object.swVersion,
            specifiedType: const FullType(String)));
    }
    if (object.recycle != null) {
      result
        ..add('recycle')
        ..add(serializers.serialize(object.recycle,
            specifiedType: const FullType(bool)));
    }
    if (object.reachable != null) {
      result
        ..add('reachable')
        ..add(serializers.serialize(object.reachable,
            specifiedType: const FullType(bool)));
    }
    if (object.on != null) {
      result
        ..add('on')
        ..add(serializers.serialize(object.on,
            specifiedType: const FullType(bool)));
    }
    if (object.battery != null) {
      result
        ..add('battery')
        ..add(serializers.serialize(object.battery,
            specifiedType: const FullType(int)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(SensorState)));
    }
    if (object.config != null) {
      result
        ..add('config')
        ..add(serializers.serialize(object.config,
            specifiedType: const FullType(SensorConfig)));
    }
    return result;
  }

  @override
  Sensor deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SensorBuilder();

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
        case 'swversion':
          result.swVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'reachable':
          result.reachable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'on':
          result.on = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'battery':
          result.battery = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
              specifiedType: const FullType(SensorState)) as SensorState);
          break;
        case 'config':
          result.config.replace(serializers.deserialize(value,
              specifiedType: const FullType(SensorConfig)) as SensorConfig);
          break;
      }
    }

    return result.build();
  }
}

class _$Sensor extends Sensor {
  @override
  final int id;
  @override
  final String type;
  @override
  final String name;
  @override
  final String modelId;
  @override
  final String uniqueId;
  @override
  final String manufacturerName;
  @override
  final String swVersion;
  @override
  final bool recycle;
  @override
  final bool reachable;
  @override
  final bool on;
  @override
  final int battery;
  @override
  final SensorState state;
  @override
  final SensorConfig config;

  factory _$Sensor([void Function(SensorBuilder) updates]) =>
      (new SensorBuilder()..update(updates)).build();

  _$Sensor._(
      {this.id,
      this.type,
      this.name,
      this.modelId,
      this.uniqueId,
      this.manufacturerName,
      this.swVersion,
      this.recycle,
      this.reachable,
      this.on,
      this.battery,
      this.state,
      this.config})
      : super._();

  @override
  Sensor rebuild(void Function(SensorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SensorBuilder toBuilder() => new SensorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sensor &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        modelId == other.modelId &&
        uniqueId == other.uniqueId &&
        manufacturerName == other.manufacturerName &&
        swVersion == other.swVersion &&
        recycle == other.recycle &&
        reachable == other.reachable &&
        on == other.on &&
        battery == other.battery &&
        state == other.state &&
        config == other.config;
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
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    type.hashCode),
                                                name.hashCode),
                                            modelId.hashCode),
                                        uniqueId.hashCode),
                                    manufacturerName.hashCode),
                                swVersion.hashCode),
                            recycle.hashCode),
                        reachable.hashCode),
                    on.hashCode),
                battery.hashCode),
            state.hashCode),
        config.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Sensor')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('modelId', modelId)
          ..add('uniqueId', uniqueId)
          ..add('manufacturerName', manufacturerName)
          ..add('swVersion', swVersion)
          ..add('recycle', recycle)
          ..add('reachable', reachable)
          ..add('on', on)
          ..add('battery', battery)
          ..add('state', state)
          ..add('config', config))
        .toString();
  }
}

class SensorBuilder implements Builder<Sensor, SensorBuilder> {
  _$Sensor _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

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

  String _swVersion;
  String get swVersion => _$this._swVersion;
  set swVersion(String swVersion) => _$this._swVersion = swVersion;

  bool _recycle;
  bool get recycle => _$this._recycle;
  set recycle(bool recycle) => _$this._recycle = recycle;

  bool _reachable;
  bool get reachable => _$this._reachable;
  set reachable(bool reachable) => _$this._reachable = reachable;

  bool _on;
  bool get on => _$this._on;
  set on(bool on) => _$this._on = on;

  int _battery;
  int get battery => _$this._battery;
  set battery(int battery) => _$this._battery = battery;

  SensorStateBuilder _state;
  SensorStateBuilder get state => _$this._state ??= new SensorStateBuilder();
  set state(SensorStateBuilder state) => _$this._state = state;

  SensorConfigBuilder _config;
  SensorConfigBuilder get config =>
      _$this._config ??= new SensorConfigBuilder();
  set config(SensorConfigBuilder config) => _$this._config = config;

  SensorBuilder();

  SensorBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _type = _$v.type;
      _name = _$v.name;
      _modelId = _$v.modelId;
      _uniqueId = _$v.uniqueId;
      _manufacturerName = _$v.manufacturerName;
      _swVersion = _$v.swVersion;
      _recycle = _$v.recycle;
      _reachable = _$v.reachable;
      _on = _$v.on;
      _battery = _$v.battery;
      _state = _$v.state?.toBuilder();
      _config = _$v.config?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sensor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Sensor;
  }

  @override
  void update(void Function(SensorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Sensor build() {
    _$Sensor _$result;
    try {
      _$result = _$v ??
          new _$Sensor._(
              id: id,
              type: type,
              name: name,
              modelId: modelId,
              uniqueId: uniqueId,
              manufacturerName: manufacturerName,
              swVersion: swVersion,
              recycle: recycle,
              reachable: reachable,
              on: on,
              battery: battery,
              state: _state?.build(),
              config: _config?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'state';
        _state?.build();
        _$failedField = 'config';
        _config?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Sensor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
