import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge_exception.dart';
import 'package:hue_dart/src/core/discovery_result.dart';
import 'package:network_tools/network_tools.dart';

/// used the find bridges in the current local network
class BridgeDiscovery {
  final Client _client;

  BridgeDiscovery(this._client);

  Future<List<DiscoveryResult>> automatic() async {
    final result = <DiscoveryResult>[];

    final List<ActiveHost> hueDevices =
        await MdnsScanner.findingMdnsWithAddress('_hue._tcp');

    for (final ActiveHost activeHost in hueDevices) {
      result.add(await manual(activeHost.address));
    }
    return result;
  }

  Future<DiscoveryResult> manual(String ipAddress) async {
    final url = 'http://$ipAddress/api/hue/config';
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
