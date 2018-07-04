import 'dart:async';

import 'package:hue_dart/src/core/bridge_response_handler.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';

class ResourceLinkApi extends Object with BridgeResponseHandler {
  String address;
  String username;

  ResourceLinkApi(this.address, this.username);

  Future<List<ResourceLink>> all() async {
    String url = '$address/api/$username/resourcelinks';
    final response = await get(url);
    return _responseToResourceLinks(response);
  }

  List<ResourceLink> _responseToResourceLinks(Map<String, dynamic> response) {
    final resourceLinks = <ResourceLink>[];
    for (String id in response.keys) {
      Map<String, dynamic> item = response[id];
      final resourceLink = new ResourceLink.fromJson(item);
      resourceLink.id = id;
      resourceLinks.add(resourceLink);
    }
    return resourceLinks;
  }

  Future<ResourceLink> single(String id) async {
    String url = '$address/api/$username/resourcelinks/$id';
    final response = await get(url);
    final resourceLink = new ResourceLink.fromJson(response);
    resourceLink.id = id;
    return resourceLink;
  }

  Future<ResourceLink> create(ResourceLink resourceLink) async {
    String url = '$address/api/$username/resourcelinks';
    final response = await post(url, resourceLink);
    resourceLink.id = result(response, key: 'id');
    return resourceLink;
  }

  Future<Map<String, dynamic>> update(ResourceLink resourceLink) async {
    String url = '$address/api/$username/resourcelinks/${resourceLink.id}';
    final response = await put(url, resourceLink);
    return result(response);
  }

  Future<void> delete(ResourceLink resourceLink) async {
    String url = '$address/api/$username/resourcelinks/${resourceLink.id}';
    return await deleteCall(url);
  }
}
