import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bridge_discovery.g.dart';

/// used the find bridges in the current local network
class BridgeDiscovery {

  Client _client;

  BridgeDiscovery(this._client);

  /// Best practice is to wait a maximum of 8 seconds for receiving the N-UPnP response back from the Hue portal before continuing.
  Future<List<DiscoveryResult>> automatic() async {
    final url = 'https://discovery.meethue.com/';
    try {
      final response = await _client.get(url);
      List responseMap = json.decode(response.body);
      final result = <DiscoveryResult>[];
      for (Map<String, dynamic> json in responseMap) {
        result.add(new DiscoveryResult.fromJson(json));
      }
      return result;
    } catch (e) {
      throw new BridgeException.fromDiscovery();
    }
  }

  Future<DiscoveryResult> manual(String ipAddress) async {
    final url = 'http://$ipAddress/api/hue/config';
    try {
      final response = await _client.get(url);
      Map responseMap = json.decode(response.body);
      final result = new DiscoveryResult.fromJson(responseMap);
      result.ipAddress = ipAddress;
      return result;
    } catch (e) {
      throw new BridgeException.fromDiscovery(ipAddress);
    }
  }
}


@JsonSerializable()
class DiscoveryResult extends Object with _$DiscoveryResultSerializerMixin {

  @JsonKey(includeIfNull: false)
  String id;

  @JsonKey(includeIfNull: false)
  String name;

  @JsonKey(includeIfNull: false)
  String mac;

  @JsonKey(name: 'apiversion', includeIfNull: false)
  String apiVersion;

  @JsonKey(name: 'internalipaddress', includeIfNull: false)
  String ipAddress;

  @JsonKey(name: 'swversion', includeIfNull: false)
  String swVersion;

  DiscoveryResult();

  factory DiscoveryResult.fromJson(Map<String, dynamic> json) => _$DiscoveryResultFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }
}


