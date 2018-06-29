class Sensor {
  ///Type name of the sensor
  String type;

  ///The human readable name of the sensor, can be changed by the user
  String name;

  ///This parameter uniquely identifies the hardware model of the device for the given manufaturer.
  String modelId;

  ///Unique id of the sensor. Should be the MAC address of the device.
  String uniqueId;

  ///The name of the device manufacturer.
  String manufacturerName;

  ///This parameter uniquely identifies the software version running in the hardware.
  String swVersion;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only for CLIP sensors on creation of resource. “false” when omitted.
  bool recycle;

  ///Indicates whether communication with devices is possible. CLIP Sensors do not yet support reachable verification.Mandatory for all Sensors except ZGPSwitch, Daylight
  bool reachable;

  ///Turns the sensor on/off. When off, state changes of the sensor are not reflected in the sensor resource. Default is "true"
  bool on;

  ///The current battery state in percent, only for battery powered devices. Not present when not provided on creation (CLIP sensors).
  int battery;
}
