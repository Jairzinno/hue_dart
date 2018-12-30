// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Group> _$groupSerializer = new _$GroupSerializer();

class _$GroupSerializer implements StructuredSerializer<Group> {
  @override
  final Iterable<Type> types = const [Group, _$Group];
  @override
  final String wireName = 'Group';

  @override
  Iterable serialize(Serializers serializers, Group object,
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
    if (object.className != null) {
      result
        ..add('class')
        ..add(serializers.serialize(object.className,
            specifiedType: const FullType(String)));
    }
    if (object.lightIds != null) {
      result
        ..add('lights')
        ..add(serializers.serialize(object.lightIds,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.lights != null) {
      result
        ..add('lights')
        ..add(serializers.serialize(object.lights,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Light)])));
    }
    if (object.recycle != null) {
      result
        ..add('recycle')
        ..add(serializers.serialize(object.recycle,
            specifiedType: const FullType(bool)));
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
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(GroupState)));
    }
    if (object.action != null) {
      result
        ..add('action')
        ..add(serializers.serialize(object.action,
            specifiedType: const FullType(Action)));
    }

    return result;
  }

  @override
  Group deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupBuilder();

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
        case 'class':
          result.className = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lights':
          result.lightIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'lights':
          result.lights.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Light)]))
              as BuiltList);
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'modelid':
          result.modelId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uniqueid':
          result.uniqueId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
              specifiedType: const FullType(GroupState)) as GroupState);
          break;
        case 'action':
          result.action.replace(serializers.deserialize(value,
              specifiedType: const FullType(Action)) as Action);
          break;
      }
    }

    return result.build();
  }
}

class _$Group extends Group {
  @override
  final int id;
  @override
  final String type;
  @override
  final String name;
  @override
  final String className;
  @override
  final BuiltList<String> lightIds;
  @override
  final BuiltList<Light> lights;
  @override
  final bool recycle;
  @override
  final String modelId;
  @override
  final String uniqueId;
  @override
  final GroupState state;
  @override
  final Action action;
  HueColor __colors;

  factory _$Group([void updates(GroupBuilder b)]) =>
      (new GroupBuilder()..update(updates)).build();

  _$Group._(
      {this.id,
      this.type,
      this.name,
      this.className,
      this.lightIds,
      this.lights,
      this.recycle,
      this.modelId,
      this.uniqueId,
      this.state,
      this.action})
      : super._();

  @override
  HueColor get colors => __colors ??= super.colors;

  @override
  Group rebuild(void updates(GroupBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupBuilder toBuilder() => new GroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Group &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        className == other.className &&
        lightIds == other.lightIds &&
        lights == other.lights &&
        recycle == other.recycle &&
        modelId == other.modelId &&
        uniqueId == other.uniqueId &&
        state == other.state &&
        action == other.action;
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
                                    $jc($jc($jc(0, id.hashCode), type.hashCode),
                                        name.hashCode),
                                    className.hashCode),
                                lightIds.hashCode),
                            lights.hashCode),
                        recycle.hashCode),
                    modelId.hashCode),
                uniqueId.hashCode),
            state.hashCode),
        action.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Group')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('className', className)
          ..add('lightIds', lightIds)
          ..add('lights', lights)
          ..add('recycle', recycle)
          ..add('modelId', modelId)
          ..add('uniqueId', uniqueId)
          ..add('state', state)
          ..add('action', action))
        .toString();
  }
}

class GroupBuilder implements Builder<Group, GroupBuilder> {
  _$Group _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _className;
  String get className => _$this._className;
  set className(String className) => _$this._className = className;

  ListBuilder<String> _lightIds;
  ListBuilder<String> get lightIds =>
      _$this._lightIds ??= new ListBuilder<String>();
  set lightIds(ListBuilder<String> lightIds) => _$this._lightIds = lightIds;

  ListBuilder<Light> _lights;
  ListBuilder<Light> get lights => _$this._lights ??= new ListBuilder<Light>();
  set lights(ListBuilder<Light> lights) => _$this._lights = lights;

  bool _recycle;
  bool get recycle => _$this._recycle;
  set recycle(bool recycle) => _$this._recycle = recycle;

  String _modelId;
  String get modelId => _$this._modelId;
  set modelId(String modelId) => _$this._modelId = modelId;

  String _uniqueId;
  String get uniqueId => _$this._uniqueId;
  set uniqueId(String uniqueId) => _$this._uniqueId = uniqueId;

  GroupStateBuilder _state;
  GroupStateBuilder get state => _$this._state ??= new GroupStateBuilder();
  set state(GroupStateBuilder state) => _$this._state = state;

  ActionBuilder _action;
  ActionBuilder get action => _$this._action ??= new ActionBuilder();
  set action(ActionBuilder action) => _$this._action = action;

  GroupBuilder();

  GroupBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _type = _$v.type;
      _name = _$v.name;
      _className = _$v.className;
      _lightIds = _$v.lightIds?.toBuilder();
      _lights = _$v.lights?.toBuilder();
      _recycle = _$v.recycle;
      _modelId = _$v.modelId;
      _uniqueId = _$v.uniqueId;
      _state = _$v.state?.toBuilder();
      _action = _$v.action?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Group other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Group;
  }

  @override
  void update(void updates(GroupBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Group build() {
    _$Group _$result;
    try {
      _$result = _$v ??
          new _$Group._(
              id: id,
              type: type,
              name: name,
              className: className,
              lightIds: _lightIds?.build(),
              lights: _lights?.build(),
              recycle: recycle,
              modelId: modelId,
              uniqueId: uniqueId,
              state: _state?.build(),
              action: _action?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lightIds';
        _lightIds?.build();
        _$failedField = 'lights';
        _lights?.build();

        _$failedField = 'state';
        _state?.build();
        _$failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Group', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
