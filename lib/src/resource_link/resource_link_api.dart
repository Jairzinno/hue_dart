import 'dart:async';

import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';

class ResourceLinkApi {
  BridgeClient _client;
  late String _username;

  ResourceLinkApi(this._client, [this._username = '']);

  set username(String username) => this._username = username;

  Future<List<ResourceLink>> all() async {
    String url = '/api/$_username/resourcelinks';
    final response = await _client.get(url);
    return _responseToResourceLinks(response);
  }

  List<ResourceLink> _responseToResourceLinks(Map<String, dynamic> response) {
    final resourceLinks = <ResourceLink>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      final resourceLink = ResourceLink.fromJson(item, id: id);
      resourceLinks.add(resourceLink);
    }
    return resourceLinks;
  }

  Future<ResourceLink> single(String id) async {
    String url = '/api/$_username/resourcelinks/$id';
    final response = await _client.get(url);
    final resourceLink = ResourceLink.fromJson(response, id: id);
    return resourceLink;
  }

  Future<ResourceLink> create(ResourceLink resourceLink) async {
    String url = '/api/$_username/resourcelinks';
    final response =
        await _client.post(url, resourceLink.toBridgeObject(), 'id');
    return resourceLink.rebuild((b) => b..id = response.key);
  }

  Future<BridgeResponse> update(ResourceLink resourceLink) async {
    String url = '/api/$_username/resourcelinks/${resourceLink.id}';
    return await _client.put(url, resourceLink.toBridgeObject());
  }

  Future<BridgeResponse> delete(ResourceLink resourceLink) async {
    String url = '/api/$_username/resourcelinks/${resourceLink.id}';
    return await _client.delete(url);
  }
}
