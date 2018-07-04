import 'package:json_annotation/json_annotation.dart';

part 'bridge_exception.g.dart';

@JsonSerializable()
class BridgeException extends Object with  _$BridgeExceptionSerializerMixin implements Exception  {
  String address;
  String description;
  String type;

  BridgeException();

  factory BridgeException.fromJson(Map<String, dynamic> json) => _$BridgeExceptionFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }
}
