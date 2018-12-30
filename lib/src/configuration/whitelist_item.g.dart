// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whitelist_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WhiteListItem> _$whiteListItemSerializer =
    new _$WhiteListItemSerializer();

class _$WhiteListItemSerializer implements StructuredSerializer<WhiteListItem> {
  @override
  final Iterable<Type> types = const [WhiteListItem, _$WhiteListItem];
  @override
  final String wireName = 'WhiteListItem';

  @override
  Iterable serialize(Serializers serializers, WhiteListItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.lastUsedDate != null) {
      result
        ..add('last use date')
        ..add(serializers.serialize(object.lastUsedDate,
            specifiedType: const FullType(String)));
    }
    if (object.createDate != null) {
      result
        ..add('create date')
        ..add(serializers.serialize(object.createDate,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  WhiteListItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WhiteListItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last use date':
          result.lastUsedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'create date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WhiteListItem extends WhiteListItem {
  @override
  final String username;
  @override
  final String lastUsedDate;
  @override
  final String createDate;
  @override
  final String name;
  DateTime __lastUsed;
  DateTime __created;

  factory _$WhiteListItem([void updates(WhiteListItemBuilder b)]) =>
      (new WhiteListItemBuilder()..update(updates)).build();

  _$WhiteListItem._(
      {this.username, this.lastUsedDate, this.createDate, this.name})
      : super._();

  @override
  DateTime get lastUsed => __lastUsed ??= super.lastUsed;

  @override
  DateTime get created => __created ??= super.created;

  @override
  WhiteListItem rebuild(void updates(WhiteListItemBuilder b)) =>
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
    return $jf($jc(
        $jc($jc($jc(0, username.hashCode), lastUsedDate.hashCode),
            createDate.hashCode),
        name.hashCode));
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
  _$WhiteListItem _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _lastUsedDate;
  String get lastUsedDate => _$this._lastUsedDate;
  set lastUsedDate(String lastUsedDate) => _$this._lastUsedDate = lastUsedDate;

  String _createDate;
  String get createDate => _$this._createDate;
  set createDate(String createDate) => _$this._createDate = createDate;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  WhiteListItemBuilder();

  WhiteListItemBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _lastUsedDate = _$v.lastUsedDate;
      _createDate = _$v.createDate;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WhiteListItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WhiteListItem;
  }

  @override
  void update(void updates(WhiteListItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$WhiteListItem build() {
    final _$result = _$v ??
        new _$WhiteListItem._(
            username: username,
            lastUsedDate: lastUsedDate,
            createDate: createDate,
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
