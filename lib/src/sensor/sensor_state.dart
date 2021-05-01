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

  factory SensorState([Function(SensorStateBuilder b) updates]) = _$SensorState;

  SensorState._();

  factory SensorState.fromJson(Map json) {
    return serializers.deserializeWith(SensorState.serializer, json)!;
  }
}
