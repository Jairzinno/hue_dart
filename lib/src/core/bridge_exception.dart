import 'package:json_annotation/json_annotation.dart';

part 'bridge_exception.g.dart';

@JsonSerializable()
class BridgeException extends Object with  _$BridgeExceptionSerializerMixin implements Exception  {
  String address;
  String description;
  dynamic type;

  BridgeException();

  BridgeException.fromDiscovery([String ipAddress]) {
    address = '/${ipAddress ?? 'nupnp'}';
    description = ipAddress != null ? 'failed to find bridge at $ipAddress' : 'failed to find bridge via nupnp';
    type = -1;
  }

  factory BridgeException.fromJson(Map<String, dynamic> json) => _$BridgeExceptionFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }
}
