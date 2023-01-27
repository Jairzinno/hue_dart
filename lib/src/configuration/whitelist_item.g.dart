// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whitelist_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WhiteListItem> _$whiteListItemSerializer =
    new _$WhiteListItemSerializer();

class _$WhiteListItemSerializer implements StructuredSerializer<WhiteListItem> {
  @override
  final Iterable<Type> types = const [WhiteListItem, $WhiteListItem];
  @override
  final String wireName = 'WhiteListItem';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    WhiteListItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.lastUsedDate;
    if (value != null) {
      result
        ..add('last use date')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(String),
          ),
        );
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create date')
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
    return result;
  }

  @override
  WhiteListItem deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new WhiteListItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'last use date':
          result.lastUsedDate = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'create date':
          result.createDate = serializers.deserialize(
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
      }
    }

    return result.build();
  }
}

class $WhiteListItem extends WhiteListItem {
  @override
  final String? username;
  @override
  final String? lastUsedDate;
  @override
  final String? createDate;
  @override
  final String? name;
  DateTime? __lastUsed;
  DateTime? __created;

  factory $WhiteListItem([void Function(WhiteListItemBuilder)? updates]) =>
      (new WhiteListItemBuilder()..update(updates)).build();

  $WhiteListItem._({
    this.username,
    this.lastUsedDate,
    this.createDate,
    this.name,
  }) : super._();

  @override
  DateTime get lastUsed => __lastUsed ??= super.lastUsed;

  @override
  DateTime get created => __created ??= super.created;

  @override
  WhiteListItem rebuild(void Function(WhiteListItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhiteListItemBuilder toBuilder() => new WhiteListItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhiteListItem &&
        username == other.username &&
        lastUsedDate == other.lastUsedDate &&
        createDate == other.createDate &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
      $jc(
        $jc(
          $jc($jc(0, username.hashCode), lastUsedDate.hashCode),
          createDate.hashCode,
        ),
        name.hashCode,
      ),
    );
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WhiteListItem')
          ..add('username', username)
          ..add('lastUsedDate', lastUsedDate)
          ..add('createDate', createDate)
          ..add('name', name))
        .toString();
  }
}

class WhiteListItemBuilder
    implements Builder<WhiteListItem, WhiteListItemBuilder> {
  $WhiteListItem? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _lastUsedDate;
  String? get lastUsedDate => _$this._lastUsedDate;
  set lastUsedDate(String? lastUsedDate) => _$this._lastUsedDate = lastUsedDate;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  WhiteListItemBuilder();

  WhiteListItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _lastUsedDate = $v.lastUsedDate;
      _createDate = $v.createDate;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WhiteListItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as $WhiteListItem;
  }

  @override
  void update(void Function(WhiteListItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $WhiteListItem build() {
    final $result = _$v ??
        new $WhiteListItem._(
          username: username,
          lastUsedDate: lastUsedDate,
          createDate: createDate,
          name: name,
        );
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
