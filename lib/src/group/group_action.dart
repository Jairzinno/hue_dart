import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'group_action.g.dart';

abstract class GroupAction
    with BridgeObject
    implements Built<GroupAction, GroupActionBuilder> {
  ///On/Off state of the group. On=true, Off=false.

  bool? get on;

  ///The average brightness of the group (off is brightness 0, if device does not support “bri”: on is brightness 255). Unreachable lights are not used in calculation. If all lights are unreachable brightness is 0.

  @BuiltValueField(wireName: 'bri')
  int? get brightness;

  ///The hue value is a wrapping value between 0 and 65535. Both 0 and 65535 are red, 25500 is green and 46920 is blue.
  ///e.g. “hue”: 50000 will set the light to a specific hue.

  int? get hue;

  ///Saturation of the group. 254 is the most saturated (colored) and 0 is the least saturated (white).

  @BuiltValueField(wireName: 'sat')
  int? get saturation;

  ///The x,y coordinate of a color in CIE color space.

  BuiltList<double>? get xy;

  ///The Mired Color temperature of the light. 2012 connected lights are capable of 153 (6500K) to 500 (2000K).

  int? get ct;

  /// The alert effect, which is a temporary change to the bulb’s state. This can take one of the following values:
  ///
  /// “none” – The light is not performing an alert effect.
  /// “select” – The light is performing one breathe cycle.
  /// “lselect” – The light is performing breathe cycles for 15 seconds or until an "alert": "none" command is received.
  /// Note that this contains the last alert sent to the light and not its current state. i.e. After the breathe cycle has finished the bridge does not reset the alert to "none".

  String? get alert;

  /// The dynamic effect of the light, can either be “none” or “colorloop”. If set to colorloop, the light will cycle through all hues using the current brightness and saturation settings.

  String? get effect;

  /// Indicates the color mode in which the light is working, this is the last command type it received. Values are “hs” for Hue and Saturation, “xy” for XY and “ct” for Color Temperature. This parameter is only present when the light supports at least one of the values.

  @BuiltValueField(wireName: 'colormode')
  String? get colorMode;

  /// The scene identifier if the scene you wish to recall.

  String? get scene;

  static Serializer<GroupAction> get serializer => _$groupActionSerializer;

  factory GroupAction([Function(GroupActionBuilder b) updates]) = _$GroupAction;

  GroupAction._();

  static GroupAction? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GroupAction.serializer, json.decode(jsonString),);
  }

  @override
  Map<String, dynamic> toBridgeObject({String? action}) {
    final body = <String, dynamic>{};
    if (on != null) {
      body['on'] = on;
    }
    if (brightness != null) {
      body['bri'] = brightness;
    }
    if (hue != null) {
      body['hue'] = hue;
    }
    if (saturation != null) {
      body['sat'] = saturation;
    }
    if (effect != null) {
      body['effect'] = effect;
    }
    if (xy != null) {
      body['xy'] = xy!.toList();
    }
    if (ct != null) {
      body['ct'] = ct;
    }
    if (alert != null) {
      body['alert'] = alert;
    }
    if (colorMode != null) {
      body['colormode'] = colorMode;
    }
    return body;
  }
}
