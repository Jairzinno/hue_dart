import 'dart:convert';

import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sensor.g.dart';

@JsonSerializable()
class Sensor extends Object with _$SensorSerializerMixin, BridgeObject {

  @JsonKey(ignore: true)
  int id;
  ///Type name of the sensor
  String type;

  ///The human readable name of the sensor, can be changed by the user
  String name;

  ///This parameter uniquely identifies the hardware model of the device for the given manufaturer.
  @JsonKey(name: 'modelid')
  String modelId;

  ///Unique id of the sensor. Should be the MAC address of the device.
  @JsonKey(name: 'uniqueid')
  String uniqueId;

  ///The name of the device manufacturer.
  @JsonKey(name: 'manufacturername')
  String manufacturerName;

  ///This parameter uniquely identifies the software version running in the hardware.
  @JsonKey(name: 'swversion')
  String swVersion;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only for CLIP sensors on creation of resource. “false” when omitted.
  @JsonKey(includeIfNull: false)
  bool recycle;

  ///Indicates whether communication with devices is possible. CLIP Sensors do not yet support reachable verification.Mandatory for all Sensors except ZGPSwitch, Daylight
  @JsonKey(includeIfNull: false)
  bool reachable;

  ///Turns the sensor on/off. When off, state changes of the sensor are not reflected in the sensor resource. Default is "true"
  @JsonKey(includeIfNull: false)
  bool on;

  ///The current battery state in percent, only for battery powered devices. Not present when not provided on creation (CLIP sensors).
  @JsonKey(includeIfNull: false)
  int battery;

  @JsonKey(includeIfNull: false)
  Map<String, dynamic> state;

  @JsonKey(includeIfNull: false)
  SensorConfig config;

  Sensor();

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  toBridgeObject({String action}) {
    if ('create' == action) {
      return this;
    } else if ('attributes' == action) {
      return {
        'name' : name,
      };
    } else if ('config' == action) {
        return config;
    } else if ('state' == action) {
        return json.encode(state);
    }
  }
}

@JsonSerializable()
class SensorConfig extends Object with _$SensorConfigSerializerMixin {

  @JsonKey(includeIfNull: false)
  bool on;

  @JsonKey(includeIfNull: false)
  bool reachable;

  @JsonKey(includeIfNull: false)
  int battery;

  SensorConfig();

  factory SensorConfig.fromJson(Map<String, dynamic> json) => _$SensorConfigFromJson(json);
}
