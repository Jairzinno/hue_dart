import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/color_helper.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends Object with _$GroupSerializerMixin, BridgeObject {
  int id;

  ///Type of the Group. If not provided on creation a “LightGroup” is created. Supported types:
  ///
  ///LightGroup, 1.4, Default
  ///Luminaire, 1.4, multisource luminaire
  ///LightSource, 1.4, multisource luminaire
  ///Room, 1.11, Represents a room
  String type;

  ///Human readable name of the group. If name is not specified one is generated for you (default name is “Group”)
  String name;

  ///As of 1.11. Category of Room types. Default is: Other.
  @JsonKey(name: 'class')
  String className;

  ///The ordered set of light ids from the lights which are  in the group. This resource shall contain an array of at least one element with the exception of the “Room” type: The Room type may contain an empty lights array. Each element can appear only once. Order of lights on creation is preserved. A light id must be an existing light resource in /lights. If an invalid lights resource is given, error 7 shall be returned and the group is not created. There shall be no change in the lights.
  ///
  ///Light id can be null if a group has been automatically create by the bridge and a light source is not yet available
  @JsonKey(fromJson: _mapFromJsonLights)
  List<Light> lights = [];

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resource. “false” when omitted.
  bool recycle;

  ///As of 1.4. Uniquely identifies the hardware model of the luminaire. Only present for automatically created Luminaires.
  @JsonKey(name: 'modelid')
  String modelId;

  ///As of 1.9. Unique Id in AA:BB:CC:DD format for Luminaire groups or AA:BB:CC:DD-XX format for Lightsource groups, where XX is the lightsource position.
  @JsonKey(name: 'uniqueid')
  String uniqueId;

  @JsonKey(includeIfNull: false)
  OnState state = new OnState();

  @JsonKey(includeIfNull: false)
  Action action = new Action();

  @JsonKey(ignore: true)
  HueColor color;

  Group();

  Group.namedWithLights(this.name, this.lights, [this.type = 'Room', this.className = 'Other']);

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  toBridgeObject({String action}) {
    if ('create' == action) {
      return {'name': name, 'class': className, 'type': type, 'lights': lights.map((Light light) => light.id.toString()).toList()};
    } else if ('attributes' == action) {
      Map<String, dynamic> body = {};
      if (name != null) {
        body['name'] = name;
      }
      if (className != null) {
        body['class'] = className;
      }
      if (lights != null) {
        body['lights'] = lights.map((Light light) => light.id.toString()).toList();
      }
      return body;
    }
  }

  void changeColor({num red = 0, num green = 0, num blue = 0}) {
    final colorHelper = new ColorHelper();
    if (action.colorMode == 'ct') {
      HueColor colors = colorHelper.rgbToCT(red, green, blue);
      action.ct = colors.ct.toInt();
    } else if (action.colorMode == 'hs') {
      HueColor colors = colorHelper.rgbToHueSaturationBrightness(red, green, blue);
      action.hue = colors.hue.toInt();
      action.saturation = colors.saturation.toInt();
      action.brightness = colors.brightness.toInt();
    } else if (action.colorMode == 'xy') {
      HueColor colors = colorHelper.rgbToXY(red, green, blue);
      action.xy = colors.xy;
    }
  }

  HueColor colors() {
    final colorHelper = new ColorHelper();
    if (action.colorMode == 'ct') {
      color = colorHelper.ctToRGB(action.ct);
    } else if (action.colorMode == 'hs') {
      color = colorHelper.hueSaturationBrightnessToRGB(action.hue, action.saturation, action.brightness);
    } else if (action.colorMode == 'xy') {
      color = colorHelper.xyToRGB(action.xy[0], action.xy[1], action.brightness);
    }
    return color;
  }
}

@JsonSerializable()
class OnState extends Object with _$OnStateSerializerMixin {
  /// “false” if all lamps are off, “true” if at least one lamp is on
  @JsonKey(name: 'any_on', includeIfNull: false)
  bool anyOn;

  /// “false” if at least one lamp is off, “true” if all lamps are on
  @JsonKey(name: 'all_on', includeIfNull: false)
  bool allOn;

  OnState();

  factory OnState.fromJson(Map<String, dynamic> json) => _$OnStateFromJson(json);

  OnState.fromJsonManually(Map<String, dynamic> json) {
    allOn = json != null ? json['all_on'] : false;
    anyOn = json != null ? json['any_on'] : false;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable()
class Action extends Object with _$ActionSerializerMixin, BridgeObject {
  ///On/Off state of the group. On=true, Off=false.
  @JsonKey(includeIfNull: false)
  bool on;

  ///The average brightness of the group (off is brightness 0, if device does not support “bri”: on is brightness 255). Unreachable lights are not used in calculation. If all lights are unreachable brightness is 0.
  @JsonKey(name: 'bri', includeIfNull: false)
  int brightness;

  ///The hue value is a wrapping value between 0 and 65535. Both 0 and 65535 are red, 25500 is green and 46920 is blue.
  ///e.g. “hue”: 50000 will set the light to a specific hue.
  @JsonKey(includeIfNull: false)
  int hue;

  ///Saturation of the group. 254 is the most saturated (colored) and 0 is the least saturated (white).
  @JsonKey(name: 'sat', includeIfNull: false)
  int saturation;

  ///The x,y coordinate of a color in CIE color space.
  @JsonKey(includeIfNull: false)
  List<num> xy;

  ///The Mired Color temperature of the light. 2012 connected lights are capable of 153 (6500K) to 500 (2000K).
  @JsonKey(includeIfNull: false)
  int ct;

  /// The alert effect, which is a temporary change to the bulb’s state. This can take one of the following values:
  ///
  /// “none” – The light is not performing an alert effect.
  /// “select” – The light is performing one breathe cycle.
  /// “lselect” – The light is performing breathe cycles for 15 seconds or until an "alert": "none" command is received.
  /// Note that this contains the last alert sent to the light and not its current state. i.e. After the breathe cycle has finished the bridge does not reset the alert to "none".
  @JsonKey(includeIfNull: false)
  String alert;

  /// The dynamic effect of the light, can either be “none” or “colorloop”. If set to colorloop, the light will cycle through all hues using the current brightness and saturation settings.
  @JsonKey(includeIfNull: false)
  String effect;

  /// Indicates the color mode in which the light is working, this is the last command type it received. Values are “hs” for Hue and Saturation, “xy” for XY and “ct” for Color Temperature. This parameter is only present when the light supports at least one of the values.
  @JsonKey(name: 'colormode', includeIfNull: false)
  String colorMode;

  /// The scene identifier if the scene you wish to recall.
  @JsonKey(includeIfNull: false)
  String scene;

  Action();

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Action.fromJsonManually(Map<String, dynamic> json) {
    on = json['on'] as bool;
    brightness = json['bri'];
    hue = json['hue'];
    saturation = json['sat'];
    effect = json['effect'];
    xy = json['xy'];
    ct = json['ct'];
    alert = json['alert'];
    colorMode = json['colormode'];
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  Map<String, dynamic> toBridgeObject({String action}) {
    Map<String, dynamic> body = {};
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
      body['xy'] = xy;
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

List<Light> _mapFromJsonLights(dynamic lights) {
  var source = lights as List<dynamic>;
  return source.map((dynamic id) => new Light.withId(id.toString())).toList();
}
