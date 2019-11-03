// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Scene> _$sceneSerializer = new _$SceneSerializer();

class _$SceneSerializer implements StructuredSerializer<Scene> {
  @override
  final Iterable<Type> types = const [Scene, _$Scene];
  @override
  final String wireName = 'Scene';

  @override
  Iterable<Object> serialize(Serializers serializers, Scene object,
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
    if (object.lightIds != null) {
      result
        ..add('lights')
        ..add(serializers.serialize(object.lightIds,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.sceneLights != null) {
      result
        ..add('sceneLights')
        ..add(serializers.serialize(object.sceneLights,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Light)])));
    }
    if (object.owner != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(object.owner,
            specifiedType: const FullType(String)));
    }
    if (object.recycle != null) {
      result
        ..add('recycle')
        ..add(serializers.serialize(object.recycle,
            specifiedType: const FullType(bool)));
    }
    if (object.locked != null) {
      result
        ..add('locked')
        ..add(serializers.serialize(object.locked,
            specifiedType: const FullType(bool)));
    }
    if (object.lastUpdated != null) {
      result
        ..add('lastupdated')
        ..add(serializers.serialize(object.lastUpdated,
            specifiedType: const FullType(String)));
    }
    if (object.version != null) {
      result
        ..add('version')
        ..add(serializers.serialize(object.version,
            specifiedType: const FullType(int)));
    }
    if (object.appData != null) {
      result
        ..add('appdata')
        ..add(serializers.serialize(object.appData,
            specifiedType: const FullType(AppData)));
    }
    if (object.picture != null) {
      result
        ..add('picture')
        ..add(serializers.serialize(object.picture,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Scene deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SceneBuilder();

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
        case 'lights':
          result.lightIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'sceneLights':
          result.sceneLights.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Light)]))
              as BuiltList<dynamic>);
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'locked':
          result.locked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lastupdated':
          result.lastUpdated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'appdata':
          result.appData.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppData)) as AppData);
          break;
        case 'picture':
          result.picture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Scene extends Scene {
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<String> lightIds;
  @override
  final BuiltList<Light> sceneLights;
  @override
  final String owner;
  @override
  final bool recycle;
  @override
  final bool locked;
  @override
  final String lastUpdated;
  @override
  final int version;
  @override
  final AppData appData;
  @override
  final String picture;

  factory _$Scene([void Function(SceneBuilder) updates]) =>
      (new SceneBuilder()..update(updates)).build();

  _$Scene._(
      {this.id,
      this.name,
      this.lightIds,
      this.sceneLights,
      this.owner,
      this.recycle,
      this.locked,
      this.lastUpdated,
      this.version,
      this.appData,
      this.picture})
      : super._();

  @override
  Scene rebuild(void Function(SceneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SceneBuilder toBuilder() => new SceneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Scene &&
        id == other.id &&
        name == other.name &&
        lightIds == other.lightIds &&
        sceneLights == other.sceneLights &&
        owner == other.owner &&
        recycle == other.recycle &&
        locked == other.locked &&
        lastUpdated == other.lastUpdated &&
        version == other.version &&
        appData == other.appData &&
        picture == other.picture;
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
                                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                                        lightIds.hashCode),
                                    sceneLights.hashCode),
                                owner.hashCode),
                            recycle.hashCode),
                        locked.hashCode),
                    lastUpdated.hashCode),
                version.hashCode),
            appData.hashCode),
        picture.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Scene')
          ..add('id', id)
          ..add('name', name)
          ..add('lightIds', lightIds)
          ..add('sceneLights', sceneLights)
          ..add('owner', owner)
          ..add('recycle', recycle)
          ..add('locked', locked)
          ..add('lastUpdated', lastUpdated)
          ..add('version', version)
          ..add('appData', appData)
          ..add('picture', picture))
        .toString();
  }
}

class SceneBuilder implements Builder<Scene, SceneBuilder> {
  _$Scene _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<String> _lightIds;
  ListBuilder<String> get lightIds =>
      _$this._lightIds ??= new ListBuilder<String>();
  set lightIds(ListBuilder<String> lightIds) => _$this._lightIds = lightIds;

  ListBuilder<Light> _sceneLights;
  ListBuilder<Light> get sceneLights =>
      _$this._sceneLights ??= new ListBuilder<Light>();
  set sceneLights(ListBuilder<Light> sceneLights) =>
      _$this._sceneLights = sceneLights;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  bool _recycle;
  bool get recycle => _$this._recycle;
  set recycle(bool recycle) => _$this._recycle = recycle;

  bool _locked;
  bool get locked => _$this._locked;
  set locked(bool locked) => _$this._locked = locked;

  String _lastUpdated;
  String get lastUpdated => _$this._lastUpdated;
  set lastUpdated(String lastUpdated) => _$this._lastUpdated = lastUpdated;

  int _version;
  int get version => _$this._version;
  set version(int version) => _$this._version = version;

  AppDataBuilder _appData;
  AppDataBuilder get appData => _$this._appData ??= new AppDataBuilder();
  set appData(AppDataBuilder appData) => _$this._appData = appData;

  String _picture;
  String get picture => _$this._picture;
  set picture(String picture) => _$this._picture = picture;

  SceneBuilder();

  SceneBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _lightIds = _$v.lightIds?.toBuilder();
      _sceneLights = _$v.sceneLights?.toBuilder();
      _owner = _$v.owner;
      _recycle = _$v.recycle;
      _locked = _$v.locked;
      _lastUpdated = _$v.lastUpdated;
      _version = _$v.version;
      _appData = _$v.appData?.toBuilder();
      _picture = _$v.picture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Scene other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Scene;
  }

  @override
  void update(void Function(SceneBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Scene build() {
    _$Scene _$result;
    try {
      _$result = _$v ??
          new _$Scene._(
              id: id,
              name: name,
              lightIds: _lightIds?.build(),
              sceneLights: _sceneLights?.build(),
              owner: owner,
              recycle: recycle,
              locked: locked,
              lastUpdated: lastUpdated,
              version: version,
              appData: _appData?.build(),
              picture: picture);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lightIds';
        _lightIds?.build();
        _$failedField = 'sceneLights';
        _sceneLights?.build();

        _$failedField = 'appData';
        _appData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Scene', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
