import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'sensor_config.g.dart';

abstract class SensorConfig
    with BridgeObject
    implements Built<SensorConfig, SensorConfigBuilder> {
  bool? get on;

  bool? get reachable;

  int? get battery;

  static Serializer<SensorConfig> get serializer => _$sensorConfigSerializer;

  SensorConfig._();

  factory SensorConfig([updates(SensorConfigBuilder b)?]) = _$SensorConfig;

  factory SensorConfig.fromJson(Map json) {
    return serializers.deserializeWith(SensorConfig.serializer, json)!;
  }

  @override
  Map toBridgeObject({String? action}) {
    return serializers.serializeWith(SensorConfig.serializer, this)
        as Map<dynamic, dynamic>;
  }
}
