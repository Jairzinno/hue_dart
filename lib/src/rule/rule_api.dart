import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/rule/rule.dart';

class RuleApi {
  BridgeClient _client;
  String _username;

  RuleApi(this._client, [this._username]);

  void set username(String username) => this._username = username;

  Future<List<Rule>> all() async {
    String url = '/api/$_username/rules';
    final response = await _client.get(url);
    return _responseToRules(response);
  }

  List<Rule> _responseToRules(Map<String, dynamic> response) {
    final rules = <Rule>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      final rule = Rule.fromJson(item, id: int.parse(id));
      rules.add(rule);
    }
    return rules;
  }

  Future<Rule> single(int id) async {
    String url = '/api/$_username/rules/$id';
    final response = await _client.get(url);
    final rule = new Rule.fromJson(response, id: id);
    return rule;
  }

  Future<Rule> create(Rule rule) async {
    String url = '/api/$_username/rules';
    final response = await _client.post(url, rule.toBridgeObject(), 'id');
    return rule.rebuild((b) => b..id = int.parse(response.key));
  }

  Future<BridgeResponse> update(Rule rule) async {
    String url = '/api/$_username/rules/${rule.id}';
    return await _client.put(url, rule.toBridgeObject());
  }

  Future<BridgeResponse> delete(Rule rule) async {
    String url = '/api/$_username/rules/${rule.id}';
    return await _client.delete(url);
  }
}
