class Light {
  ///id of the light in the bridge
  int id;

  ///A fixed name describing the type of light e.g. “Extended color light”.
  String type;

  ///A unique, editable name given to the light.
  String name;

  ///The hardware model of the light.
  String modelId;

  ///As of 1.4. Unique id of the device. The MAC address of the device with a unique endpoint id in the form: AA:BB:CC:DD:EE:FF:00:11-XX
  String uniqueId;

  ///As of 1.7. The manufacturer name.
  String manufacturerName;

  ///As of 1.9. Unique ID of the luminaire the light is a part of in the format: AA:BB:CC:DD-XX-YY.  AA:BB:, ... represents the hex of the luminaireid, XX the lightsource position (incremental but may contain gaps) and YY the lightpoint position (index of light in luminaire group).  A gap in the lightpoint position indicates an incomplete luminaire (light search required to discover missing light points in this case).
  String luminaireUniqueId;

  ///An identifier for the software version running on the light.
  String swVersion;

  ///On/Off state of the light. On=true, Off=false.
  bool on;

  ///Brightness of the light. This is a scale from the minimum brightness the light is capable of, 1, to the maximum capable brightness, 254.
  int brightness;

  ///Hue of the light. This is a wrapping value between 0 and 65535. Both 0 and 65535 are red, 25500 is green and 46920 is blue.
  int hue;

  ///Saturation of the light. 254 is the most saturated (colored) and 0 is the least saturated (white).
  int saturation;

  ///The x coordinate of a color in CIE color space.
  double x;

  ///The y coordinate of a color in CIE color space.
  double y;

  ///The Mired Color temperature of the light. 2012 connected lights are capable of 153 (6500K) to 500 (2000K).
  int ct;

  /// The alert effect, which is a temporary change to the bulb’s state. This can take one of the following values:
  ///
  ///“none” – The light is not performing an alert effect.
  ///“select” – The light is performing one breathe cycle.
  ///“lselect” – The light is performing breathe cycles for 15 seconds or until an "alert": "none" command is received.
  ///Note that this contains the last alert sent to the light and not its current state. i.e. After the breathe cycle has finished the bridge does not reset the alert to "none".
  String alert;

  ///The dynamic effect of the light, can either be “none” or “colorloop”. If set to colorloop, the light will cycle through all hues using the current brightness and saturation settings.
  String effect;

  ///Indicates the color mode in which the light is working, this is the last command type it received. Values are “hs” for Hue and Saturation, “xy” for XY and “ct” for Color Temperature. This parameter is only present when the light supports at least one of the values.
  String colorMode;

  ///Indicates if a light can be reached by the bridge.
  bool reachable;
}
