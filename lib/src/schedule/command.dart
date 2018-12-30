import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'command.g.dart';

abstract class Command with BridgeObject implements Built<Command, CommandBuilder> {

  ///Path to a light resource, a group resource or any other bridge resource (including "/api/<username>/")
  String get address;

  ///The HTTP method used to send the body to the given address. Either "POST", "PUT", "DELETE" for local addresses.
  String get method;

  ///JSON string to be sent to the relevant resource.
  BuiltMap<String, String> get body;

  static Serializer<Command> get serializer => _$commandSerializer;

  Command._();

  factory Command([updates(CommandBuilder b)]) = _$Command;

  factory Command.fromJson(Map json) {
    return serializers.deserializeWith(
      Command.serializer, json
    );
  }

  @override
    Map toBridgeObject({String action}) {
      return serializers.serializeWith(serializer, this);
    }
}