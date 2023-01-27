// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_services.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InternetServices> _$internetServicesSerializer =
    new _$InternetServicesSerializer();

class _$InternetServicesSerializer
    implements StructuredSerializer<InternetServices> {
  @override
  final Iterable<Type> types = const [InternetServices, _$InternetServices];
  @override
  final String wireName = 'InternetServices';

  @override
  Iterable<Object?> serialize(Serializers serializers, InternetServices object,
      {FullType specifiedType = FullType.unspecified,}) {
    final result = <Object?>[
      'internet',
      serializers.serialize(object.internet,
          specifiedType: const FullType(String),),
      'remoteaccess',
      serializers.serialize(object.remoteAccess,
          specifiedType: const FullType(String),),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
      'swupdate',
      serializers.serialize(object.swUpdate,
          specifiedType: const FullType(String),),
    ];

    return result;
  }

  @override
  InternetServices deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified,}) {
    final result = new InternetServicesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'internet':
          result.internet = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'remoteaccess':
          result.remoteAccess = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
        case 'swupdate':
          result.swUpdate = serializers.deserialize(value,
              specifiedType: const FullType(String),) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InternetServices extends InternetServices {
  @override
  final String internet;
  @override
  final String remoteAccess;
  @override
  final String time;
  @override
  final String swUpdate;

  factory _$InternetServices(
          [void Function(InternetServicesBuilder)? updates,]) =>
      (new InternetServicesBuilder()..update(updates)).build();

  _$InternetServices._(
      {required this.internet,
      required this.remoteAccess,
      required this.time,
      required this.swUpdate,})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        internet, 'InternetServices', 'internet',);
    BuiltValueNullFieldError.checkNotNull(
        remoteAccess, 'InternetServices', 'remoteAccess',);
    BuiltValueNullFieldError.checkNotNull(time, 'InternetServices', 'time');
    BuiltValueNullFieldError.checkNotNull(
        swUpdate, 'InternetServices', 'swUpdate',);
  }

  @override
  InternetServices rebuild(void Function(InternetServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InternetServicesBuilder toBuilder() =>
      new InternetServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InternetServices &&
        internet == other.internet &&
        remoteAccess == other.remoteAccess &&
        time == other.time &&
        swUpdate == other.swUpdate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, internet.hashCode), remoteAccess.hashCode),
            time.hashCode,),
        swUpdate.hashCode,),);
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InternetServices')
          ..add('internet', internet)
          ..add('remoteAccess', remoteAccess)
          ..add('time', time)
          ..add('swUpdate', swUpdate))
        .toString();
  }
}

class InternetServicesBuilder
    implements Builder<InternetServices, InternetServicesBuilder> {
  _$InternetServices? _$v;

  String? _internet;
  String? get internet => _$this._internet;
  set internet(String? internet) => _$this._internet = internet;

  String? _remoteAccess;
  String? get remoteAccess => _$this._remoteAccess;
  set remoteAccess(String? remoteAccess) => _$this._remoteAccess = remoteAccess;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  String? _swUpdate;
  String? get swUpdate => _$this._swUpdate;
  set swUpdate(String? swUpdate) => _$this._swUpdate = swUpdate;

  InternetServicesBuilder();

  InternetServicesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _internet = $v.internet;
      _remoteAccess = $v.remoteAccess;
      _time = $v.time;
      _swUpdate = $v.swUpdate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InternetServices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InternetServices;
  }

  @override
  void update(void Function(InternetServicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InternetServices build() {
    final $result = _$v ??
        new _$InternetServices._(
            internet: BuiltValueNullFieldError.checkNotNull(
                internet, 'InternetServices', 'internet',),
            remoteAccess: BuiltValueNullFieldError.checkNotNull(
                remoteAccess, 'InternetServices', 'remoteAccess',),
            time: BuiltValueNullFieldError.checkNotNull(
                time, 'InternetServices', 'time',),
            swUpdate: BuiltValueNullFieldError.checkNotNull(
                swUpdate, 'InternetServices', 'swUpdate',),);
    replace($result);
    return $result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
