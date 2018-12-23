import 'dart:async';

import 'package:hue_dart/src/core/bridge.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';

class ResourceLinksBloc {
  final Bridge bridge;

  final StreamController<List<ResourceLink>> _resourceLinks =
      StreamController();
  Stream<List<ResourceLink>> get resourceLinks => _resourceLinks.stream;

  ResourceLinksBloc(this.bridge) {
    init();
  }

  void init() async {
    final currentResourceLinks = await bridge.resourceLinks();
    _resourceLinks.add(currentResourceLinks);
  }
}
