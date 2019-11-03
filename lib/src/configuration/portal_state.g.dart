// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PortalState> _$portalStateSerializer = new _$PortalStateSerializer();

class _$PortalStateSerializer implements StructuredSerializer<PortalState> {
  @override
  final Iterable<Type> types = const [PortalState, _$PortalState];
  @override
  final String wireName = 'PortalState';

  @override
  Iterable<Object> serialize(Serializers serializers, PortalState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'communication',
      serializers.serialize(object.communication,
          specifiedType: const FullType(String)),
      'incoming',
      serializers.serialize(object.incoming,
          specifiedType: const FullType(bool)),
      'outgoing',
      serializers.serialize(object.outgoing,
          specifiedType: const FullType(bool)),
      'signedon',
      serializers.serialize(object.signedOn,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  PortalState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PortalStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'communication':
          result.communication = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'incoming':
          result.incoming = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'outgoing':
          result.outgoing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'signedon':
          result.signedOn = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PortalState extends PortalState {
  @override
  final String communication;
  @override
  final bool incoming;
  @override
  final bool outgoing;
  @override
  final bool signedOn;

  factory _$PortalState([void Function(PortalStateBuilder) updates]) =>
      (new PortalStateBuilder()..update(updates)).build();

  _$PortalState._(
      {this.communication, this.incoming, this.outgoing, this.signedOn})
      : super._() {
    if (communication == null) {
      throw new BuiltValueNullFieldError('PortalState', 'communication');
    }
    if (incoming == null) {
      throw new BuiltValueNullFieldError('PortalState', 'incoming');
    }
    if (outgoing == null) {
      throw new BuiltValueNullFieldError('PortalState', 'outgoing');
    }
    if (signedOn == null) {
      throw new BuiltValueNullFieldError('PortalState', 'signedOn');
    }
  }

  @override
  PortalState rebuild(void Function(PortalStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PortalStateBuilder toBuilder() => new PortalStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PortalState &&
        communication == other.communication &&
        incoming == other.incoming &&
        outgoing == other.outgoing &&
        signedOn == other.signedOn;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, communication.hashCode), incoming.hashCode),
            outgoing.hashCode),
        signedOn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PortalState')
          ..add('communication', communication)
          ..add('incoming', incoming)
          ..add('outgoing', outgoing)
          ..add('signedOn', signedOn))
        .toString();
  }
}

class PortalStateBuilder implements Builder<PortalState, PortalStateBuilder> {
  _$PortalState _$v;

  String _communication;
  String get communication => _$this._communication;
  set communication(String communication) =>
      _$this._communication = communication;

  bool _incoming;
  bool get incoming => _$this._incoming;
  set incoming(bool incoming) => _$this._incoming = incoming;

  bool _outgoing;
  bool get outgoing => _$this._outgoing;
  set outgoing(bool outgoing) => _$this._outgoing = outgoing;

  bool _signedOn;
  bool get signedOn => _$this._signedOn;
  set signedOn(bool signedOn) => _$this._signedOn = signedOn;

  PortalStateBuilder();

  PortalStateBuilder get _$this {
    if (_$v != null) {
      _communication = _$v.communication;
      _incoming = _$v.incoming;
      _outgoing = _$v.outgoing;
      _signedOn = _$v.signedOn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PortalState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PortalState;
  }

  @override
  void update(void Function(PortalStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PortalState build() {
    final _$result = _$v ??
        new _$PortalState._(
            communication: communication,
            incoming: incoming,
            outgoing: outgoing,
            signedOn: signedOn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
