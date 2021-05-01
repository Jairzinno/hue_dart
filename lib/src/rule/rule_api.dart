import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/rule/rule.dart';

class RuleApi {
  final BridgeClient _client;
  late String _username;

  RuleApi(this._client, [this._username = '']);

  // ignore: avoid_setters_without_getters
  set username(String username) => _username = username;

  Future<List<Rule>> all() async {
    final url = '/api/$_username/rules';
    final response = await _client.get(url);
    return _responseToRules(response);
  }

  List<Rule> _responseToRules(Map<String, dynamic> response) {
    final rules = <Rule>[];
    for (final id in response.keys) {
      final item = response[id] as Map<String, dynamic>;
      final rule = Rule.fromJson(item, id: int.parse(id));
      rules.add(rule);
    }
    return rules;
  }

  Future<Rule> single(int id) async {
    final url = '/api/$_username/rules/$id';
    final response = await _client.get(url);
    final rule = Rule.fromJson(response, id: id);
    return rule;
  }

  Future<Rule> create(Rule rule) async {
    final url = '/api/$_username/rules';
    final response = await _client.post(url, rule.toBridgeObject(), 'id');
    return rule.rebuild((b) => b..id = int.parse(response.key as String));
  }

  Future<BridgeResponse> update(Rule rule) async {
    final url = '/api/$_username/rules/${rule.id}';
    return _client.put(url, rule.toBridgeObject());
  }

  Future<BridgeResponse> delete(Rule rule) async {
    final url = '/api/$_username/rules/${rule.id}';
    return _client.delete(url);
  }
}
