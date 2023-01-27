// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BackUp> _$backUpSerializer = new _$BackUpSerializer();

class _$BackUpSerializer implements StructuredSerializer<BackUp> {
  @override
  final Iterable<Type> types = const [BackUp, $BackUp];
  @override
  final String wireName = 'BackUp';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    BackUp object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'status',
      serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      ),
      'errorcode',
      serializers.serialize(
        object.errorCode,
        specifiedType: const FullType(int),
      ),
    ];

    return result;
  }

  @override
  BackUp deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new BackUpBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          break;
        case 'errorcode':
          result.errorCode = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          break;
      }
    }

    return result.build();
  }
}

class $BackUp extends BackUp {
  @override
  final String status;
  @override
  final int errorCode;

  factory $BackUp([void Function(BackUpBuilder)? updates]) =>
      (new BackUpBuilder()..update(updates)).build();

  $BackUp._({required this.status, required this.errorCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(status, 'BackUp', 'status');
    BuiltValueNullFieldError.checkNotNull(errorCode, 'BackUp', 'errorCode');
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
  $BackUp? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _errorCode;
  int? get errorCode => _$this._errorCode;
  set errorCode(int? errorCode) => _$this._errorCode = errorCode;

  BackUpBuilder();

  BackUpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _errorCode = $v.errorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BackUp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as $BackUp;
  }

  @override
  void update(void Function(BackUpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $BackUp build() {
    final $result = _$v ??
        new $BackUp._(
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            'BackUp',
            'status',
          ),
          errorCode: BuiltValueNullFieldError.checkNotNull(
            errorCode,
            'BackUp',
            'errorCode',
          ),
        );
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
