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
  Iterable<Object?> serialize(Serializers serializers, Sensor object,
      {FullType specifiedType = FullType.unspecified,}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String),),);
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String),),);
    }
    value = object.modelId;
    if (value != null) {
      result
        ..add('modelid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String),),);
    }
    value = object.uniqueId;
    if (value != null) {
      result
        ..add('uniqueid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String),),);
    }
    value = object.manufacturerName;
    if (value != null) {
      result
        ..add('manufacturername')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String),),);
    }
    value = object.swVersion;
    if (value != null) {
      result
        ..add('swversion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String),),);
    }
    value = object.recycle;
    if (value != null) {
      result
        ..add('recycle')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)),);
    }
    value = object.reachable;
    if (value != null) {
      result
        ..add('reachable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)),);
    }
    value = object.on;
    if (value != null) {
      result
        ..add('on')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)),);
    }
    value = object.battery;
    if (value != null) {
      result
        ..add('battery')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SensorState),),);
    }
    value = object.config;
    if (value != null) {
      result
        ..add('config')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SensorConfig),),);
    }
    return result;
  }

  @override
  Sensor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified,}) {
    final result = new SensorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int),) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'modelid':
          result.modelId = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'uniqueid':
          result.uniqueId = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'manufacturername':
          result.manufacturerName = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'swversion':
          result.swVersion = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(value,
              specifiedType: const FullType(bool),) as bool;
          break;
        case 'reachable':
          result.reachable = serializers.deserialize(value,
              specifiedType: const FullType(bool),) as bool;
          break;
        case 'on':
          result.on = serializers.deserialize(value,
              specifiedType: const FullType(bool),) as bool;
          break;
        case 'battery':
          result.battery = serializers.deserialize(value,
              specifiedType: const FullType(int),) as int;
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
              specifiedType: const FullType(SensorState),)! as SensorState,);
          break;
        case 'config':
          result.config.replace(serializers.deserialize(value,
              specifiedType: const FullType(SensorConfig),)! as SensorConfig,);
          break;
      }
    }

    return result.build();
  }
}

class _$Sensor extends Sensor {
  @override
  final int? id;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? modelId;
  @override
  final String? uniqueId;
  @override
  final String? manufacturerName;
  @override
  final String? swVersion;
  @override
  final bool? recycle;
  @override
  final bool? reachable;
  @override
  final bool? on;
  @override
  final int? battery;
  @override
  final SensorState? state;
  @override
  final SensorConfig? config;

  factory _$Sensor([void Function(SensorBuilder)? updates]) =>
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
      this.config,})
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
                                                    type.hashCode,),
                                                name.hashCode,),
                                            modelId.hashCode,),
                                        uniqueId.hashCode,),
                                    manufacturerName.hashCode,),
                                swVersion.hashCode,),
                            recycle.hashCode,),
                        reachable.hashCode,),
                    on.hashCode,),
                battery.hashCode,),
            state.hashCode,),
        config.hashCode,),);
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
  _$Sensor? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _modelId;
  String? get modelId => _$this._modelId;
  set modelId(String? modelId) => _$this._modelId = modelId;

  String? _uniqueId;
  String? get uniqueId => _$this._uniqueId;
  set uniqueId(String? uniqueId) => _$this._uniqueId = uniqueId;

  String? _manufacturerName;
  String? get manufacturerName => _$this._manufacturerName;
  set manufacturerName(String? manufacturerName) =>
      _$this._manufacturerName = manufacturerName;

  String? _swVersion;
  String? get swVersion => _$this._swVersion;
  set swVersion(String? swVersion) => _$this._swVersion = swVersion;

  bool? _recycle;
  bool? get recycle => _$this._recycle;
  set recycle(bool? recycle) => _$this._recycle = recycle;

  bool? _reachable;
  bool? get reachable => _$this._reachable;
  set reachable(bool? reachable) => _$this._reachable = reachable;

  bool? _on;
  bool? get on => _$this._on;
  set on(bool? on) => _$this._on = on;

  int? _battery;
  int? get battery => _$this._battery;
  set battery(int? battery) => _$this._battery = battery;

  SensorStateBuilder? _state;
  SensorStateBuilder get state => _$this._state ??= new SensorStateBuilder();
  set state(SensorStateBuilder? state) => _$this._state = state;

  SensorConfigBuilder? _config;
  SensorConfigBuilder get config =>
      _$this._config ??= new SensorConfigBuilder();
  set config(SensorConfigBuilder? config) => _$this._config = config;

  SensorBuilder();

  SensorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _modelId = $v.modelId;
      _uniqueId = $v.uniqueId;
      _manufacturerName = $v.manufacturerName;
      _swVersion = $v.swVersion;
      _recycle = $v.recycle;
      _reachable = $v.reachable;
      _on = $v.on;
      _battery = $v.battery;
      _state = $v.state?.toBuilder();
      _config = $v.config?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sensor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Sensor;
  }

  @override
  void update(void Function(SensorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Sensor build() {
    _$Sensor $result;
    try {
      $result = _$v ??
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
              config: _config?.build(),);
    } catch (_) {
      late String $failedField;
      try {
        $failedField = 'state';
        _state?.build();
        $failedField = 'config';
        _config?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Sensor', $failedField, e.toString(),);
      }
      rethrow;
    }
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
