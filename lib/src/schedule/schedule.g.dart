// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Schedule> _$scheduleSerializer = new _$ScheduleSerializer();

class _$ScheduleSerializer implements StructuredSerializer<Schedule> {
  @override
  final Iterable<Type> types = const [Schedule, _$Schedule];
  @override
  final String wireName = 'Schedule';

  @override
  Iterable<Object> serialize(Serializers serializers, Schedule object,
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
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.time != null) {
      result
        ..add('localtime')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.autoDelete != null) {
      result
        ..add('autodelete')
        ..add(serializers.serialize(object.autoDelete,
            specifiedType: const FullType(bool)));
    }
    if (object.recycle != null) {
      result
        ..add('recycle')
        ..add(serializers.serialize(object.recycle,
            specifiedType: const FullType(bool)));
    }
    if (object.command != null) {
      result
        ..add('command')
        ..add(serializers.serialize(object.command,
            specifiedType: const FullType(Command)));
    }
    return result;
  }

  @override
  Schedule deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'localtime':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'autodelete':
          result.autoDelete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'recycle':
          result.recycle = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'command':
          result.command.replace(serializers.deserialize(value,
              specifiedType: const FullType(Command)) as Command);
          break;
      }
    }

    return result.build();
  }
}

class _$Schedule extends Schedule {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String time;
  @override
  final String status;
  @override
  final bool autoDelete;
  @override
  final bool recycle;
  @override
  final Command command;
  ScheduleType __type;

  factory _$Schedule([void Function(ScheduleBuilder) updates]) =>
      (new ScheduleBuilder()..update(updates)).build();

  _$Schedule._(
      {this.id,
      this.name,
      this.description,
      this.time,
      this.status,
      this.autoDelete,
      this.recycle,
      this.command})
      : super._();

  @override
  ScheduleType get type => __type ??= super.type;

  @override
  Schedule rebuild(void Function(ScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleBuilder toBuilder() => new ScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedule &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        time == other.time &&
        status == other.status &&
        autoDelete == other.autoDelete &&
        recycle == other.recycle &&
        command == other.command;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), name.hashCode),
                            description.hashCode),
                        time.hashCode),
                    status.hashCode),
                autoDelete.hashCode),
            recycle.hashCode),
        command.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Schedule')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('time', time)
          ..add('status', status)
          ..add('autoDelete', autoDelete)
          ..add('recycle', recycle)
          ..add('command', command))
        .toString();
  }
}

class ScheduleBuilder implements Builder<Schedule, ScheduleBuilder> {
  _$Schedule _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  bool _autoDelete;
  bool get autoDelete => _$this._autoDelete;
  set autoDelete(bool autoDelete) => _$this._autoDelete = autoDelete;

  bool _recycle;
  bool get recycle => _$this._recycle;
  set recycle(bool recycle) => _$this._recycle = recycle;

  CommandBuilder _command;
  CommandBuilder get command => _$this._command ??= new CommandBuilder();
  set command(CommandBuilder command) => _$this._command = command;

  ScheduleBuilder();

  ScheduleBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _time = _$v.time;
      _status = _$v.status;
      _autoDelete = _$v.autoDelete;
      _recycle = _$v.recycle;
      _command = _$v.command?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Schedule other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Schedule;
  }

  @override
  void update(void Function(ScheduleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Schedule build() {
    _$Schedule _$result;
    try {
      _$result = _$v ??
          new _$Schedule._(
              id: id,
              name: name,
              description: description,
              time: time,
              status: status,
              autoDelete: autoDelete,
              recycle: recycle,
              command: _command?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'command';
        _command?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Schedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
