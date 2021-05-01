import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';

class ResourceLinkApi {
  final BridgeClient _client;
  late String _username;

  ResourceLinkApi(this._client, [this._username = '']);

  // ignore: avoid_setters_without_getters
  set username(String username) => _username = username;

  Future<List<ResourceLink>> all() async {
    final url = '/api/$_username/resourcelinks';
    final response = await _client.get(url);
    return _responseToResourceLinks(response);
  }

  List<ResourceLink> _responseToResourceLinks(Map<String, dynamic> response) {
    final resourceLinks = <ResourceLink>[];
    for (final id in response.keys) {
      final item = response[id] as Map<String, dynamic>;
      final resourceLink = ResourceLink.fromJson(item, id: id);
      resourceLinks.add(resourceLink);
    }
    return resourceLinks;
  }

  Future<ResourceLink> single(String id) async {
    final url = '/api/$_username/resourcelinks/$id';
    final response = await _client.get(url);
    final resourceLink = ResourceLink.fromJson(response, id: id);
    return resourceLink;
  }

  Future<ResourceLink> create(ResourceLink resourceLink) async {
    final url = '/api/$_username/resourcelinks';
    final response =
        await _client.post(url, resourceLink.toBridgeObject(), 'id');
    return resourceLink.rebuild((b) => b..id = response.key as String?);
  }

  Future<BridgeResponse> update(ResourceLink resourceLink) async {
    final url = '/api/$_username/resourcelinks/${resourceLink.id}';
    return _client.put(url, resourceLink.toBridgeObject());
  }

  Future<BridgeResponse> delete(ResourceLink resourceLink) async {
    final url = '/api/$_username/resourcelinks/${resourceLink.id}';
    return _client.delete(url);
  }
}
