import 'dart:async';

import 'package:hue_dart/src/core/bridge.dart';
import 'package:hue_dart/src/group/group.dart';

class GroupsBloc {
  final Bridge bridge;

  final StreamController<List<Group>> _groups = StreamController();
  Stream<List<Group>> get groups => _groups.stream;

  GroupsBloc(this.bridge) {
    init();
  }

  Future<void> init() async {
    final currentGroups = await bridge.groups();
    _groups.add(currentGroups);
  }
}
