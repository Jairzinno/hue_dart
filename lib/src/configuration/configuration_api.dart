import 'dart:async';

import 'package:hue_dart/src/configuration/configuration.dart';
import 'package:hue_dart/src/core/bridge_response_handler.dart';

class ConfigurationApi extends Object with BridgeResponseHandler {
  String address;

  ConfigurationApi(this.address);

  /// Creates a new user.
  ///
  /// The link button on the bridge must be pressed and this command executed within 30 seconds.
  /// Once a new user has been created, the user key is added to a ‘whitelist’, allowing access to API commands that require a whitelisted user.
  ///  At present, all other API commands require a whitelisted user.
  Future<String> createUser(String deviceType) async {
    String url = '$address/api/';
    final response = await post(url, {'devicetype' : deviceType});
    return result(response, key: 'username');
  }

  Future<bool> deleteUser(String username, String deletingUsername) async {
    String url = '$address/api/$username/config/whitelist/$deletingUsername';
    return await deleteCall(url);
  }

  /// Returns list of all configuration elements in the bridge. Note all times are stored in UTC.
  Future<Configuration> configuration(String username) async {
    String url = '$address/api/$username/config';
    final response = await get(url);
    return Configuration.fromJson(response);
  }

  /// This command is used to fetch the entire datastore from the device, including settings and state information for lights, groups, schedules and configuration.
  ///
  /// It should only be used sparingly as it is resource intensive for the bridge, but is supplied e.g. for synchronization purposes.
  Future<Configuration> completeConfiguration(String username) async {
    String url = '$address/api/$username';
    final response = await get(url);
    return Configuration.fromJson(response);
  }


  /// Allows the user to set some configuration values.
  Future<Map<String, dynamic>> update(String username, Configuration configuration) async {
    String url = '$address/api/$username/config';
    final response = await put(url, configuration.toBridgeObject());
    return result(response);
  }
}
