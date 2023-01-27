import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge_exception.dart';
import 'package:hue_dart/src/core/bridge_response.dart';

const protocol = 'http://';

/// the [BridgeClient] handles all calls to the bridge.
///
/// It performs the request with a platform specific [Client], parses the responses and checks for exceptions
class BridgeClient {
  final Client _client;
  final String _address;

  BridgeClient(this._client, String address) : _address = '$protocol$address';

  String getAddress() => _address;

  Future<Map<String, dynamic>> get(String url) async {
    final response = await _client.get(Uri.parse('$_address$url'));
    final responseMap = json.decode(response.body);
    _checkException(responseMap);
    return responseMap as Map<String, dynamic>;
  }

  void _checkException(dynamic response) {
    if (response is List) {
      final resultMap = response.first as Map<String, dynamic>;
      if (resultMap.containsKey('error')) {
        final errorMap = resultMap['error'] as Map<String, dynamic>?;
        print('Error $errorMap');
        throw BridgeException.fromJson(errorMap);
      }
    }
  }

  Future<BridgeResponse> post(String url,
      [dynamic body, String? resultKey,]) async {
    late Response response;
    if (body != null) {
      response = await _client.post(Uri.parse('$_address$url'),
          body: json.encode(body),);
    } else {
      response = await _client.post(Uri.parse('$_address$url'));
    }
    final responseMap = json.decode(response.body);
    _checkException(responseMap);
    return _result(responseMap, resultKey);
  }

  BridgeResponse _result(dynamic response, [String? key]) {
    return BridgeResponse(response, key);
  }

  Future<BridgeResponse> put(String url, dynamic body) async {
    final response =
        await _client.put(Uri.parse('$_address$url'), body: json.encode(body));
    final responseMap = json.decode(response.body);
    _checkException(responseMap);
    return _result(responseMap);
  }

  Future<BridgeResponse> delete(String url) async {
    final response = await _client.delete(Uri.parse('$_address$url'));
    if (response.body.isNotEmpty) {
      final responseMap = json.decode(response.body);
      _checkException(responseMap);
      return _result(responseMap);
    } else {
      return BridgeResponse([]);
    }
  }
}
