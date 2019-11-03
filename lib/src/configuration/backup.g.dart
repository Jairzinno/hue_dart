// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BackUp> _$backUpSerializer = new _$BackUpSerializer();

class _$BackUpSerializer implements StructuredSerializer<BackUp> {
  @override
  final Iterable<Type> types = const [BackUp, _$BackUp];
  @override
  final String wireName = 'BackUp';

  @override
  Iterable<Object> serialize(Serializers serializers, BackUp object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'errorcode',
      serializers.serialize(object.errorCode,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  BackUp deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BackUpBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'errorcode':
          result.errorCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BackUp extends BackUp {
  @override
  final String status;
  @override
  final int errorCode;

  factory _$BackUp([void Function(BackUpBuilder) updates]) =>
      (new BackUpBuilder()..update(updates)).build();

  _$BackUp._({this.status, this.errorCode}) : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('BackUp', 'status');
    }
    if (errorCode == null) {
      throw new BuiltValueNullFieldError('BackUp', 'errorCode');
    }
  }

  @override
  BackUp rebuild(void Function(BackUpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BackUpBuilder toBuilder() => new BackUpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BackUp &&
        status == other.status &&
        errorCode == other.errorCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, status.hashCode), errorCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BackUp')
          ..add('status', status)
          ..add('errorCode', errorCode))
        .toString();
  }
}

class BackUpBuilder implements Builder<BackUp, BackUpBuilder> {
  _$BackUp _$v;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  int _errorCode;
  int get errorCode => _$this._errorCode;
  set errorCode(int errorCode) => _$this._errorCode = errorCode;

  BackUpBuilder();

  BackUpBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _errorCode = _$v.errorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BackUp other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BackUp;
  }

  @override
  void update(void Function(BackUpBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BackUp build() {
    final _$result =
        _$v ?? new _$BackUp._(status: status, errorCode: errorCode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
