import 'package:hue_dart/src/light/light.dart';

class Group {

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
  String className;

  ///The ordered set of light ids from the lights which are  in the group. This resource shall contain an array of at least one element with the exception of the “Room” type: The Room type may contain an empty lights array. Each element can appear only once. Order of lights on creation is preserved. A light id must be an existing light resource in /lights. If an invalid lights resource is given, error 7 shall be returned and the group is not created. There shall be no change in the lights.
  ///
  ///Light id can be null if a group has been automatically create by the bridge and a light source is not yet available
  List<Light> lights;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resource. “false” when omitted.
  bool recycle;

  ///As of 1.4. Uniquely identifies the hardware model of the luminaire. Only present for automatically created Luminaires.
  String modelId;

  ///As of 1.9. Unique Id in AA:BB:CC:DD format for Luminaire groups or AA:BB:CC:DD-XX format for Lightsource groups, where XX is the lightsource position.
  String uniqueId;

  ///On/Off state of the group. On=true, Off=false.
  bool on;

  ///The average brightness of the group (off is brightness 0, if device does not support “bri”: on is brightness 255). Unreachable lights are not used in calculation. If all lights are unreachable brightness is 0.
  int brightness;

  ///The hue value is a wrapping value between 0 and 65535. Both 0 and 65535 are red, 25500 is green and 46920 is blue.
  ///e.g. “hue”: 50000 will set the light to a specific hue.
  int hue;

  ///Saturation of the group. 254 is the most saturated (colored) and 0 is the least saturated (white).
  int saturation;

  ///The x coordinate of a color in CIE color space.
  num x;

  ///The y coordinate of a color in CIE color space.
  num y;

  ///The Mired Color temperature of the light. 2012 connected lights are capable of 153 (6500K) to 500 (2000K).
  int ct;

  /// The alert effect, which is a temporary change to the bulb’s state. This can take one of the following values:
  ///
  /// “none” – The light is not performing an alert effect.
  /// “select” – The light is performing one breathe cycle.
  /// “lselect” – The light is performing breathe cycles for 15 seconds or until an "alert": "none" command is received.
  /// Note that this contains the last alert sent to the light and not its current state. i.e. After the breathe cycle has finished the bridge does not reset the alert to "none".
  String alert;

  /// The dynamic effect of the light, can either be “none” or “colorloop”. If set to colorloop, the light will cycle through all hues using the current brightness and saturation settings.
  String effect;


  /// Indicates the color mode in which the light is working, this is the last command type it received. Values are “hs” for Hue and Saturation, “xy” for XY and “ct” for Color Temperature. This parameter is only present when the light supports at least one of the values.
  String colorMode;

  /// The scene identifier if the scene you wish to recall.
  String scene;

  /// “false” if all lamps are off, “true” if at least one lamp is on
  bool anyOn;

  /// “false” if at least one lamp is off, “true” if all lamps are on
  bool allOn;

  /// Last time a state of at least one of the light in this group was changed
  num lastUpdated;

  /// Last time the group state change on/off
  num lastSwitched;
}
