import 'dart:async';
import 'dart:convert';

import 'package:hue_dart/src/core/bridge_exception.dart';
import 'package:http/http.dart' as http;

class BridgeResponseHandler {

  Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(url);
    Map responseMap = json.decode(response.body);
    checkException(responseMap);
    return responseMap;
  }

  Future<Map<String, dynamic>> post(String url, [dynamic body]) async {
    var response;
    if (body != null) {
      response = await http.post(url, body: json.encode(body));
    } else {
      response = await http.post(url);
    }
    var responseMap = json.decode(response.body);
    checkException(responseMap);
    return responseMap;
  }

  Future<Map<String, dynamic>> put(String url, dynamic body) async {
    final response = await http.put(url, body: json.encode(body));
    var responseMap = json.decode(response.body);
    checkException(responseMap);
    return responseMap;
  }

  Future<bool> deleteCall(String url) async {
    final response = await http.delete(url);
    if (response.body.isNotEmpty) {
      var responseMap = json.decode(response.body);
      checkException(responseMap);
      return result(responseMap) != null;
    } else {
      return true;
    }
  }

  checkException(dynamic response) {
    if (response is List) {
      Map<String, dynamic> resultMap = response.first;
      if (resultMap.containsKey('error')) {
        Map<String, dynamic> errorMap = resultMap['error'];
        var exception = new BridgeException.fromJson(errorMap);
        throw exception;
      }
    }
  }

  result(dynamic response, {String key}) {
    if (response is List) {
      if (key != null) {
        Map<String, dynamic> resultMap = response.first;
        if (resultMap.containsKey('success')) {
          return resultMap['success'][key];
        }
      } else {
        List<dynamic> result = [];
        for (Map<String, dynamic> resultMap in response) {
          result.add(resultMap['success']);
        }
        return result;
      }
    }
  }

}
