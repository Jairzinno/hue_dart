import 'dart:async';

import 'package:hue_dart/src/core/bridge.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class SensorsBloc {
  final Bridge bridge;

  final StreamController<List<Sensor>> _sensors = StreamController();
  Stream<List<Sensor>> get sensors => _sensors.stream;

  SensorsBloc(this.bridge) {
    init();
  }

  Future<void> init() async {
    final currentSensors = await bridge.sensors();
    _sensors.add(currentSensors);
  }
}
