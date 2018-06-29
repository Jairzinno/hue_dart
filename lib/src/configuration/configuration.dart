import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';
import 'package:hue_dart/src/rule/rule.dart';
import 'package:hue_dart/src/scene/scene.dart';
import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class Configuration {
  /// Name of the bridge. This is also its uPnP name, so will reflect the actual uPnP name after any conflicts have been resolved.
  String name;

  /// Contains information related to software updates.
  SoftwareUpdate softwareUpdate;

  /// A list of whitelisted user IDs.
  List<UserId> whitelist;

  /// The version of the hue API in the format <major>.<minor>.<patch>, for example 1.2.1
  String apiVersion;

  /// Software version of the bridge.
  String swVersion;

  /// IP Address of the proxy server being used. A value of “none” indicates no proxy.
  String proxyAddress;

  /// Port of the proxy being used by the bridge. If set to 0 then a proxy is not being used.
  int proxyPort;

  /// Indicates whether the link button has been pressed within the last 30 seconds.
  bool linkButton;

  /// IP address of the bridge.
  String ipAddress;

  /// MAC address of the bridge.
  String mac;

  /// Network mask of the bridge.
  String netmask;

  /// Gateway IP address of the bridge.
  String gateway;

  /// Whether the IP address of the bridge is obtained with DHCP.
  bool dhcp;

  /// This indicates whether the bridge is registered to synchronize data with a portal account.
  bool portalServices;

  PortalState portalState;

  /// Current time stored on the bridge.
  String utc;

  /// The local time of the bridge. "none" if not available.
  String localTime;

  /// Timezone of the bridge as OlsenIDs, like "Europe/Amsterdam" or "none" when not configured.
  String timeZone;

  /// The current wireless frequency channel used by the bridge. It can take values of 11, 15, 20,25 or 0 if undefined (factory new).
  int zigbeeChannel;

  /// This parameter uniquely identifies the hardware model of the bridge (BSB001, BSB002).
  String modelId;

  /// The unique bridge id. This is currently generated from the bridge Ethernet mac address.
  String bridgeId;

  /// Indicates if bridge settings are factory new.
  bool factoryNew;

  /// If a bridge backup file has been restored on this bridge from a bridge with a different bridgeid, it will indicate that bridge id, otherwise it will be null.
  String replacesBridgeId;

  List<Light> lights;
  List<Group> groups;
  List<Scene> scenes;
  List<Schedule> schedules;
  List<Sensor> sensors;
  List<Rule> rules;
  List<ResourceLink> resourceLinks;
}

class UserId {
  String id;
  String lastUsedDate;
  String createDate;
  String name;
}

class PortalState {
  String communication;
  bool incoming;
  bool outgoing;
  bool signedOn;
}

class SoftwareUpdate {
  /// Setting this flag to true lets the bridge search for software updates in the portal.
  ///
  /// After the search attempt, this flag is set back to false.
  /// Requires portal connection to update server.
  /// See software update for more information.
  bool checkForUpdate;
  bool updateBridge;
  List<Light> lights;
  int updateState;
  String url;
  String text;
  bool notify;
}
