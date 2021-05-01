import 'package:hue_dart/src/sensor/sensor.dart';

abstract class SensorModel {
  String? modelId;
  String get productName;

  SensorModel._withSensor(Sensor sensor) {
    modelId = sensor.modelId;
  }
}

class DayLight extends SensorModel {
  DayLight._withSensor(Sensor sensor) : super._withSensor(sensor);

  @override
  String get productName => 'DayLight';
}

class Dimmer extends SensorModel {
  Dimmer._withSensor(Sensor sensor) : super._withSensor(sensor);

  @override
  String get productName => 'Hue Wireless Dimmer';
}

class Motion extends SensorModel {
  Motion._withSensor(Sensor sensor) : super._withSensor(sensor);

  @override
  String get productName => 'Hue Motion Sensor';
}

class Tap extends SensorModel {
  Tap._withSensor(Sensor sensor) : super._withSensor(sensor);

  @override
  String get productName => 'Hue Tap';
}

class SensorModelFactory {
  static SensorModel? create(Sensor sensor) {
    final modelId = sensor.modelId;
    if (_isDayLightSensor(modelId)) {
      return DayLight._withSensor(sensor);
    } else if (_isDimmerSensor(modelId)) {
      return Dimmer._withSensor(sensor);
    } else if (_isMotionSensor(modelId)) {
      return Motion._withSensor(sensor);
    } else if (_isTapSensor(modelId)) {
      return Tap._withSensor(sensor);
    }
    return null;
  }

  static bool _isDayLightSensor(String? modelId) => 'PHDL00' == modelId;

  static bool _isDimmerSensor(String? modelId) =>
      ['RWL020', 'RWL021'].contains(modelId);

  static bool _isMotionSensor(String? modelId) => 'SML001' == modelId;

  static bool _isTapSensor(String? modelId) => 'ZGPSWITCH' == modelId;
}
