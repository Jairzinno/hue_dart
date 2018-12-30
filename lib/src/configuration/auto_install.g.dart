// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_install.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AutoInstall> _$autoInstallSerializer = new _$AutoInstallSerializer();

class _$AutoInstallSerializer implements StructuredSerializer<AutoInstall> {
  @override
  final Iterable<Type> types = const [AutoInstall, _$AutoInstall];
  @override
  final String wireName = 'AutoInstall';

  @override
  Iterable serialize(Serializers serializers, AutoInstall object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'on',
      serializers.serialize(object.on, specifiedType: const FullType(bool)),
      'updatetime',
      serializers.serialize(object.updateTime,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AutoInstall deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AutoInstallBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'on':
          result.on = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'updatetime':
          result.updateTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AutoInstall extends AutoInstall {
  @override
  final bool on;
  @override
  final String updateTime;
  DateTime __updateDate;

  factory _$AutoInstall([void updates(AutoInstallBuilder b)]) =>
      (new AutoInstallBuilder()..update(updates)).build();

  _$AutoInstall._({this.on, this.updateTime}) : super._() {
    if (on == null) {
      throw new BuiltValueNullFieldError('AutoInstall', 'on');
    }
    if (updateTime == null) {
      throw new BuiltValueNullFieldError('AutoInstall', 'updateTime');
    }
  }

  @override
  DateTime get updateDate => __updateDate ??= super.updateDate;

  @override
  AutoInstall rebuild(void updates(AutoInstallBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AutoInstallBuilder toBuilder() => new AutoInstallBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutoInstall &&
        on == other.on &&
        updateTime == other.updateTime;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, on.hashCode), updateTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AutoInstall')
          ..add('on', on)
          ..add('updateTime', updateTime))
        .toString();
  }
}

class AutoInstallBuilder implements Builder<AutoInstall, AutoInstallBuilder> {
  _$AutoInstall _$v;

  bool _on;
  bool get on => _$this._on;
  set on(bool on) => _$this._on = on;

  String _updateTime;
  String get updateTime => _$this._updateTime;
  set updateTime(String updateTime) => _$this._updateTime = updateTime;

  AutoInstallBuilder();

  AutoInstallBuilder get _$this {
    if (_$v != null) {
      _on = _$v.on;
      _updateTime = _$v.updateTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AutoInstall other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AutoInstall;
  }

  @override
  void update(void updates(AutoInstallBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AutoInstall build() {
    final _$result = _$v ?? new _$AutoInstall._(on: on, updateTime: updateTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
