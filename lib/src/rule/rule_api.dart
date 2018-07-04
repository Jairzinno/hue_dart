import 'dart:async';

import 'package:hue_dart/src/core/bridge_response_handler.dart';
import 'package:hue_dart/src/rule/rule.dart';

class RuleApi extends Object with BridgeResponseHandler {
  String address;
  String username;

  RuleApi(this.address, this.username);

  Future<List<Rule>> all() async {
    String url = '$address/api/$username/rules';
    final response = await get(url);
    return _responseToRules(response);
  }

  List<Rule> _responseToRules(Map<String, dynamic> response) {
    final rules = <Rule>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      final rule = new Rule.fromJson(item);
      rule.id = int.parse(id);
      rules.add(rule);
    }
    return rules;
  }

  Future<Rule> single(int id) async {
    String url = '$address/api/$username/rules/$id';
    final response = await get(url);
    final rule = new Rule.fromJson(response);
    rule.id = id;
    return rule;
  }

  Future<Rule> create(Rule rule) async {
    String url = '$address/api/$username/rules';
    final response = await post(url, rule);
    rule.id = int.parse(result(response, key: 'id'));
    return rule;
  }

  Future<Map<String, dynamic>> update(Rule rule) async {
    String url = '$address/api/$username/rules/${rule.id}';
    final response = await put(url, rule);
    return result(response);
  }

  Future<void> delete(Rule rule) async {
    String url = '$address/api/$username/rules/${rule.id}';
    return await deleteCall(url);
  }
}
