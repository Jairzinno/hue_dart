import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:hue_dart/src/sensor/sensor_config.dart';
import 'package:hue_dart/src/sensor/sensor_model.dart';
import 'package:hue_dart/src/sensor/sensor_state.dart';

part 'sensor.g.dart';

abstract class Sensor
    with BridgeObject
    implements Built<Sensor, SensorBuilder> {
  @nullable
  int get id;

  ///Type name of the sensor
  @nullable
  String get type;

  ///The human readable name of the sensor, can be changed by the user
  @nullable
  String get name;

  ///This parameter uniquely identifies the hardware model of the device for the given manufaturer.
  @BuiltValueField(wireName: 'modelid')
  @nullable
  String get modelId;

  ///Unique id of the sensor. Should be the MAC address of the device.
  @BuiltValueField(wireName: 'uniqueid')
  @nullable
  String get uniqueId;

  ///The name of the device manufacturer.
  @BuiltValueField(wireName: 'manufacturername')
  @nullable
  String get manufacturerName;

  ///This parameter uniquely identifies the software version running in the hardware.
  @BuiltValueField(wireName: 'swversion')
  @nullable
  String get swVersion;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only for CLIP sensors on creation of resource. “false” when omitted.
  @nullable
  bool get recycle;

  ///Indicates whether communication with devices is possible. CLIP Sensors do not yet support reachable verification.Mandatory for all Sensors except ZGPSwitch, Daylight
  @nullable
  bool get reachable;

  ///Turns the sensor on/off. When off, state changes of the sensor are not reflected in the sensor resource. Default is "true"
  @nullable
  bool get on;

  ///The current battery state in percent, only for battery powered devices. Not present when not provided on creation (CLIP sensors).
  @nullable
  int get battery;

  @nullable
  SensorState get state;

  @nullable
  SensorConfig get config;

  static Serializer<Sensor> get serializer => _$sensorSerializer;

  Sensor._();

  factory Sensor([updates(SensorBuilder b)]) = _$Sensor;

  factory Sensor.fromJson(Map json, {int id}) {
    return serializers
        .deserializeWith(Sensor.serializer, json)
        .rebuild((b) => b..id = id);
  }

  SensorModel get model => SensorModelFactory.create(this);

  @override
  Map toBridgeObject({String action}) {
    if ('create' == action) {
      return serializers.serializeWith(Sensor.serializer, this);
    } else if ('attributes' == action) {
      return {
        'name': name,
      };
    } else if ('config' == action) {
      return config.toBridgeObject();
    } else if ('state' == action) {
      return serializers.serializeWith(serializer, state);
    }
    return null;
  }  
}
