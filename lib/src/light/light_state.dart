import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'light_state.g.dart';

abstract class LightState with BridgeObject implements Built<LightState, LightStateBuilder> {

  /// On/Off state of the light. On=true, Off=false.
  @nullable
  bool get on;

  /// Brightness of the light. This is a scale from the minimum brightness the light is capable of, 1, to the maximum capable brightness, 254.
  @BuiltValueField(wireName: 'bri')
  @nullable
  int get brightness;

  /// Hue of the light. This is a wrapping value between 0 and 65535. Both 0 and 65535 are red, 25500 is green and 46920 is blue.
  @nullable
  int get hue;

  /// Saturation of the light. 254 is the most saturated (colored) and 0 is the least saturated (white).
  @BuiltValueField(wireName: 'sat')
  @nullable
  int get saturation;

  /// The x,y coordinate of a color in CIE color space.
  @nullable
  BuiltList<num> get xy;

  /// The Mired Color temperature of the light. 2012 connected lights are capable of 153 (6500K) to 500 (2000K).
  @nullable
  int get ct;

  /// The alert effect, which is a temporary change to the bulb’s state. This can take one of the following values:
  ///
  /// “none” – The light is not performing an alert effect.
  /// “select” – The light is performing one breathe cycle.
  /// “lselect” – The light is performing breathe cycles for 15 seconds or until an "alert": "none" command is received.
  /// Note that this contains the last alert sent to the light and not its current state. i.e. After the breathe cycle has finished the bridge does not reset the alert to "none".
  @nullable
  String get alert;

  /// The dynamic effect of the light, can either be “none” or “colorloop”. If set to colorloop, the light will cycle through all hues using the current brightness and saturation settings.
  @nullable
  String get effect;

  /// Indicates the color mode in which the light is working, this is the last command type it received. Values are “hs” for Hue and Saturation, “xy” for XY and “ct” for Color Temperature. This parameter is only present when the light supports at least one of the values.
  @BuiltValueField(wireName: 'colormode')
  @nullable
  String get colorMode;

  /// Indicates if a light can be reached by the bridge.
  @nullable
  bool get reachable;

  @nullable
  String get mode;

  static Serializer<LightState> get serializer => _$lightStateSerializer;

  LightState._();

  factory LightState([updates(LightStateBuilder b)]) = _$LightState;

  factory LightState.fromJson(Map json) {
    return serializers.deserializeWith(
      LightState.serializer, json
    );
  }
  
  @override
  Map toBridgeObject({String action}) {
    return serializers.serializeWith(serializer, this);
  }
}