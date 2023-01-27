// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Group> _$groupSerializer = new _$GroupSerializer();

class _$GroupSerializer implements StructuredSerializer<Group> {
  @override
  final Iterable<Type> types = const [Group, $Group];
  @override
  final String wireName = 'Group';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Group object, {
    FullType specifiedType = FullType.unspecified,
  }) {
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
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.className;
    if (value != null) {
      result
        ..add('class')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.lightIds;
    if (value != null) {
      result
        ..add('lights')
        ..add(
          serializers.serialize(
            value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)]),
          ),
        );
    }
    value = object.groupLights;
    if (value != null) {
      result
        ..add('groupLights')
        ..add(
          serializers.serialize(
            value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Light)]),
          ),
        );
    }
    value = object.recycle;
    if (value != null) {
      result
        ..add('recycle')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }
    value = object.modelId;
    if (value != null) {
      result
        ..add('modelid')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.uniqueId;
    if (value != null) {
      result
        ..add('uniqueid')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(GroupState),
          ),
        );
    }
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(GroupAction),
          ),
        );
    }
    return result;
  }

  @override
  Group deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'class':
          result.className = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'lights':
          result.lightIds.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(
                BuiltList,
                const [const FullType(String)],
              ),
            )! as BuiltList<Object>,
          );
          break;
        case 'groupLights':
          result.groupLights.replace(
            serializers.deserialize(
              value,
              specifiedType:
                  const FullType(BuiltList, const [const FullType(Light)]),
            )! as BuiltList<Object>,
          );
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          break;
        case 'modelid':
          result.modelId = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'uniqueid':
          result.uniqueId = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'state':
          result.state.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupState),
            )! as GroupState,
          );
          break;
        case 'action':
          result.action.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupAction),
            )! as GroupAction,
          );
          break;
      }
    }

    return result.build();
  }
}

class $Group extends Group {
  @override
  final int? id;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? className;
  @override
  final BuiltList<String>? lightIds;
  @override
  final BuiltList<Light>? groupLights;
  @override
  final bool? recycle;
  @override
  final String? modelId;
  @override
  final String? uniqueId;
  @override
  final GroupState? state;
  @override
  final GroupAction? action;
  HueColor? __colors;
  bool ___colors = false;

  factory $Group([void Function(GroupBuilder)? updates]) =>
      (new GroupBuilder()..update(updates)).build();

  $Group._({
    this.id,
    this.type,
    this.name,
    this.className,
    this.lightIds,
    this.groupLights,
    this.recycle,
    this.modelId,
    this.uniqueId,
    this.state,
    this.action,
  }) : super._();

  @override
  HueColor? get colors {
    if (!___colors) {
      __colors = super.colors;
      ___colors = true;
    }
    return __colors;
  }

  @override
  Group rebuild(void Function(GroupBuilder) updates) =>
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
        groupLights == other.groupLights &&
        recycle == other.recycle &&
        modelId == other.modelId &&
        uniqueId == other.uniqueId &&
        state == other.state &&
        action == other.action;
  }

  @override
  int get hashCode {
    return $jf(
      $jc(
        $jc(
          $jc(
            $jc(
              $jc(
                $jc(
                  $jc(
                    $jc(
                      $jc(
                        $jc($jc(0, id.hashCode), type.hashCode),
                        name.hashCode,
                      ),
                      className.hashCode,
                    ),
                    lightIds.hashCode,
                  ),
                  groupLights.hashCode,
                ),
                recycle.hashCode,
              ),
              modelId.hashCode,
            ),
            uniqueId.hashCode,
          ),
          state.hashCode,
        ),
        action.hashCode,
      ),
    );
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Group')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('className', className)
          ..add('lightIds', lightIds)
          ..add('groupLights', groupLights)
          ..add('recycle', recycle)
          ..add('modelId', modelId)
          ..add('uniqueId', uniqueId)
          ..add('state', state)
          ..add('action', action))
        .toString();
  }
}

class GroupBuilder implements Builder<Group, GroupBuilder> {
  $Group? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _className;
  String? get className => _$this._className;
  set className(String? className) => _$this._className = className;

  ListBuilder<String>? _lightIds;
  ListBuilder<String> get lightIds =>
      _$this._lightIds ??= new ListBuilder<String>();
  set lightIds(ListBuilder<String>? lightIds) => _$this._lightIds = lightIds;

  ListBuilder<Light>? _groupLights;
  ListBuilder<Light> get groupLights =>
      _$this._groupLights ??= new ListBuilder<Light>();
  set groupLights(ListBuilder<Light>? groupLights) =>
      _$this._groupLights = groupLights;

  bool? _recycle;
  bool? get recycle => _$this._recycle;
  set recycle(bool? recycle) => _$this._recycle = recycle;

  String? _modelId;
  String? get modelId => _$this._modelId;
  set modelId(String? modelId) => _$this._modelId = modelId;

  String? _uniqueId;
  String? get uniqueId => _$this._uniqueId;
  set uniqueId(String? uniqueId) => _$this._uniqueId = uniqueId;

  GroupStateBuilder? _state;
  GroupStateBuilder get state => _$this._state ??= new GroupStateBuilder();
  set state(GroupStateBuilder? state) => _$this._state = state;

  GroupActionBuilder? _action;
  GroupActionBuilder get action => _$this._action ??= new GroupActionBuilder();
  set action(GroupActionBuilder? action) => _$this._action = action;

  GroupBuilder();

  GroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _className = $v.className;
      _lightIds = $v.lightIds?.toBuilder();
      _groupLights = $v.groupLights?.toBuilder();
      _recycle = $v.recycle;
      _modelId = $v.modelId;
      _uniqueId = $v.uniqueId;
      _state = $v.state?.toBuilder();
      _action = $v.action?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Group other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as $Group;
  }

  @override
  void update(void Function(GroupBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $Group build() {
    $Group $result;
    try {
      $result = _$v ??
          new $Group._(
            id: id,
            type: type,
            name: name,
            className: className,
            lightIds: _lightIds?.build(),
            groupLights: _groupLights?.build(),
            recycle: recycle,
            modelId: modelId,
            uniqueId: uniqueId,
            state: _state?.build(),
            action: _action?.build(),
          );
    } catch (_) {
      late String $failedField;
      try {
        $failedField = 'lightIds';
        _lightIds?.build();
        $failedField = 'groupLights';
        _groupLights?.build();

        $failedField = 'state';
        _state?.build();
        $failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          'Group',
          $failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
