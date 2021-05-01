import 'dart:async';

import 'package:hue_dart/src/configuration/configuration.dart';
import 'package:hue_dart/src/configuration/whitelist_item.dart';
import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:intl/intl.dart';

class ConfigurationApi {
  final BridgeClient _client;

  ConfigurationApi(this._client);

  /// Creates a new user.
  ///
  /// The link button on the bridge must be pressed and this command executed within 30 seconds.
  /// Once a new user has been created, the user key is added to a ‘whitelist’, allowing access to API commands that require a whitelisted user.
  ///  At present, all other API commands require a whitelisted user.
  Future<WhiteListItem> createUser(String deviceType) async {
    const url = '/api/';
    final response =
        await _client.post(url, {'devicetype': deviceType}, 'username');
    final createDate = DateFormat("yyyy-MM-dd'T'HH:m:s").format(DateTime.now());
    return WhiteListItem((w) => w
      ..username = response.key as String?
      ..name = deviceType
      ..createDate = createDate
      ..lastUsedDate = createDate);
  }

  Future<BridgeResponse> deleteUser(
      String username, String deletingUsername) async {
    final url = '/api/$username/config/whitelist/$deletingUsername';
    return _client.delete(url);
  }

  /// Returns list of all configuration elements in the bridge. Note all times are stored in UTC.
  Future<Configuration> configuration(String username) async {
    final url = '/api/$username/config';
    final response = await _client.get(url);
    return Configuration.fromJson(response);
  }

  /// This command is used to fetch the entire datastore from the device, including settings and state information for lights, groups, schedules and configuration.
  ///
  /// It should only be used sparingly as it is resource intensive for the bridge, but is supplied e.g. for synchronization purposes.
  Future<Configuration> completeConfiguration(String username) async {
    final url = '/api/$username';
    final response = await _client.get(url);
    return Configuration.fromJson(response);
  }

  /// Allows the user to set some configuration values.
  Future<BridgeResponse> update(
      String username, Configuration configuration) async {
    final url = '/api/$username/config';
    return _client.put(url, configuration.toBridgeObject());
  }
}
