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
  Client _client;
  String _address;

  BridgeClient(Client client, String address) {
    this._client = client;
    this._address = '$protocol$address';
  }

  Future<Map<String, dynamic>> get(String url) async {
    final response = await _client.get('$_address$url');
    Map responseMap = json.decode(response.body);
    _checkException(responseMap);
    return responseMap;
  }

  _checkException(dynamic response) {
    if (response is List) {
      Map<String, dynamic> resultMap = response.first;
      if (resultMap.containsKey('error')) {
        Map<String, dynamic> errorMap = resultMap['error'];
        var exception = new BridgeException.fromJson(errorMap);
        throw exception;
      }
    }
  }

  Future<BridgeResponse> post(String url,
      [dynamic body, String resultKey]) async {
    var response;
    if (body != null) {
      response = await _client.post('$_address$url', body: json.encode(body));
    } else {
      response = await _client.post('$_address$url');
    }
    var responseMap = json.decode(response.body);
    _checkException(responseMap);
    return _result(responseMap, resultKey);
  }

  BridgeResponse _result(dynamic response, [String key]) {
    return new BridgeResponse(response, key);
  }

  Future<BridgeResponse> put(String url, dynamic body) async {
    final response =
    await _client.put('$_address$url', body: json.encode(body));
    var responseMap = json.decode(response.body);
    _checkException(responseMap);
    return _result(responseMap);
  }

  Future<BridgeResponse> delete(String url) async {
    final response = await _client.delete('$_address$url');
    if (response.body.isNotEmpty) {
      var responseMap = json.decode(response.body);
      _checkException(responseMap);
      return _result(responseMap);
    } else {
      return new BridgeResponse([]);
    }
  }
}
