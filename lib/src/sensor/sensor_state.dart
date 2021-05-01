import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'sensor_state.g.dart';

abstract class SensorState implements Built<SensorState, SensorStateBuilder> {
  bool? get presence;

  @BuiltValueField(wireName: 'lastupdated')
  String? get lastUpdated;

  int? get temperature;

  @BuiltValueField(wireName: 'buttonevent')
  int? get buttonEvent;

  String? get daylight;

  static Serializer<SensorState> get serializer => _$sensorStateSerializer;

  SensorState._();

  factory SensorState([updates(SensorStateBuilder b)?]) = _$SensorState;

  factory SensorState.fromJson(Map json) {
    return serializers.deserializeWith(SensorState.serializer, json)!;
  }
}
