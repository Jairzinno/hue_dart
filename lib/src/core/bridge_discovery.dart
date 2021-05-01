import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge_exception.dart';
import 'package:hue_dart/src/core/discovery_result.dart';

/// used the find bridges in the current local network
class BridgeDiscovery {
  final Client _client;

  BridgeDiscovery(this._client);

  /// Best practice is to wait a maximum of 8 seconds for receiving the N-UPnP response back from the Hue portal before continuing.
  Future<List<DiscoveryResult>> automatic() async {
    const url = 'https://discovery.meethue.com/';
    try {
      final response = await _client.get(Uri.parse(url));
      final responseMap = json.decode(response.body);
      final result = <DiscoveryResult>[];
      for (final json in responseMap) {
        result.add(DiscoveryResult.fromJson(json as Map<String, dynamic>));
      }
      return result;
    } catch (e) {
      throw BridgeException();
    }
  }

  Future<DiscoveryResult> manual(String ipAddress) async {
    final url = 'https://$ipAddress/api/hue/config';
    try {
      final response = await _client.get(Uri.parse(url));
      final responseMap = json.decode(response.body) as Map<String, dynamic>;
      final result = DiscoveryResult.fromJson(responseMap)
          .rebuild((b) => b..ipAddress = ipAddress);
      return result;
    } catch (e) {
      throw BridgeException();
    }
  }
}
