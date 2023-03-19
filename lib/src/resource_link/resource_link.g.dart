// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_link.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResourceLink> _$resourceLinkSerializer =
    new _$ResourceLinkSerializer();

class _$ResourceLinkSerializer implements StructuredSerializer<ResourceLink> {
  @override
  final Iterable<Type> types = const [ResourceLink, $ResourceLink];
  @override
  final String wireName = 'ResourceLink';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResourceLink object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
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
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.classId;
    if (value != null) {
      result
        ..add('classid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.links;
    if (value != null) {
      result
        ..add('links')
        ..add(
          serializers.serialize(
            value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)]),
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
    return result;
  }

  @override
  ResourceLink deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new ResourceLinkBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(
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
        case 'description':
          result.description = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'classid':
          result.classId = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          break;
        case 'links':
          result.links.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(
                BuiltList,
                const [const FullType(String)],
              ),
            )! as BuiltList<Object>,
          );
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          break;
      }
    }

    return result.build();
  }
}

class $ResourceLink extends ResourceLink {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? type;
  @override
  final String? owner;
  @override
  final int? classId;
  @override
  final BuiltList<String>? links;
  @override
  final bool? recycle;

  factory $ResourceLink([void Function(ResourceLinkBuilder)? updates]) =>
      (new ResourceLinkBuilder()..update(updates)).build();

  $ResourceLink._({
    this.id,
    this.name,
    this.description,
    this.type,
    this.owner,
    this.classId,
    this.links,
    this.recycle,
  }) : super._();

  @override
  ResourceLink rebuild(void Function(ResourceLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceLinkBuilder toBuilder() => new ResourceLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourceLink &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        type == other.type &&
        owner == other.owner &&
        classId == other.classId &&
        links == other.links &&
        recycle == other.recycle;
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
                  $jc($jc(0, id.hashCode), name.hashCode),
                  description.hashCode,
                ),
                type.hashCode,
              ),
              owner.hashCode,
            ),
            classId.hashCode,
          ),
          links.hashCode,
        ),
        recycle.hashCode,
      ),
    );
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResourceLink')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('type', type)
          ..add('owner', owner)
          ..add('classId', classId)
          ..add('links', links)
          ..add('recycle', recycle))
        .toString();
  }
}

class ResourceLinkBuilder
    implements Builder<ResourceLink, ResourceLinkBuilder> {
  $ResourceLink? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  int? _classId;
  int? get classId => _$this._classId;
  set classId(int? classId) => _$this._classId = classId;

  ListBuilder<String>? _links;
  ListBuilder<String> get links => _$this._links ??= new ListBuilder<String>();
  set links(ListBuilder<String>? links) => _$this._links = links;

  bool? _recycle;
  bool? get recycle => _$this._recycle;
  set recycle(bool? recycle) => _$this._recycle = recycle;

  ResourceLinkBuilder();

  ResourceLinkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _type = $v.type;
      _owner = $v.owner;
      _classId = $v.classId;
      _links = $v.links?.toBuilder();
      _recycle = $v.recycle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourceLink other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as $ResourceLink;
  }

  @override
  void update(void Function(ResourceLinkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ResourceLink build() {
    $ResourceLink $result;
    try {
      $result = _$v ??
          new $ResourceLink._(
            id: id,
            name: name,
            description: description,
            type: type,
            owner: owner,
            classId: classId,
            links: _links?.build(),
            recycle: recycle,
          );
    } catch (_) {
      late String $failedField;
      try {
        $failedField = 'links';
        _links?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          'ResourceLink',
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
