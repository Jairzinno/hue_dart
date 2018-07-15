import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';
import 'package:hue_dart/src/rule/rule.dart';
import 'package:hue_dart/src/scene/scene.dart';
import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:hue_dart/src/sensor/sensor.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'configuration.g.dart';

@JsonSerializable()
class Configuration extends Object with _$ConfigurationSerializerMixin, BridgeObject {

  /// Name of the bridge. This is also its uPnP name, so will reflect the actual uPnP name after any conflicts have been resolved.
  @JsonKey(includeIfNull: false)
  String name;

  /// Contains information related to software updates.
  @JsonKey(name:'swupdate2', includeIfNull: false)
  SoftwareUpdate softwareUpdate;

  /// A list of whitelisted user IDs.
  @JsonKey(includeIfNull: false, fromJson: _mapFromJsonWhitelist)
  List<UserId> whitelist;

  /// The version of the hue API in the format <major>.<minor>.<patch>, for example 1.2.1
  @JsonKey(name:'apiversion', includeIfNull: false )
  String apiVersion;

  /// Software version of the bridge.
  @JsonKey(name:'swversion', includeIfNull: false)
  String swVersion;

  /// IP Address of the proxy server being used. A value of “none” indicates no proxy.
  @JsonKey(name:'proxyaddress', includeIfNull: false)
  String proxyAddress;

  /// Port of the proxy being used by the bridge. If set to 0 then a proxy is not being used.
  @JsonKey(name:'proxyport', includeIfNull: false)
  int proxyPort;

  /// Indicates whether the link button has been pressed within the last 30 seconds.
  @JsonKey(name:'linkbutton', includeIfNull: false)
  bool linkButton;

  /// IP address of the bridge.
  @JsonKey(name:'ipaddress', includeIfNull: false)
  String ipAddress;

  /// MAC address of the bridge.
  @JsonKey(includeIfNull: false)
  String mac;

  /// Network mask of the bridge.
  @JsonKey(name:'netmask', includeIfNull: false)
  String netMask;

  /// Gateway IP address of the bridge.
  @JsonKey(includeIfNull: false)
  String gateway;

  /// Whether the IP address of the bridge is obtained with DHCP.
  @JsonKey(includeIfNull: false)
  bool dhcp;

  /// This indicates whether the bridge is registered to synchronize data with a portal account.
  @JsonKey(name:'portalservices', includeIfNull: false)
  bool portalServices;

  @JsonKey(name:'portalstate', includeIfNull: false)
  PortalState portalState;

  @JsonKey(name:'portalconnection', includeIfNull: false)
  String portalConnection;

  /// Current time stored on the bridge.
  @JsonKey(name: 'UTC', includeIfNull: false)
  String utc;

  DateTime get utcDate => new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(utc);

  /// The local time of the bridge. "none" if not available.
  @JsonKey(name:'localtime', includeIfNull: false)
  String localTime;

  DateTime get localTimeDate => new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(localTime);

  /// Timezone of the bridge as OlsenIDs, like "Europe/Amsterdam" or "none" when not configured.
  @JsonKey(name:'timezone', includeIfNull: false)
  String timeZone;

  /// The current wireless frequency channel used by the bridge. It can take values of 11, 15, 20,25 or 0 if undefined (factory new).
  @JsonKey(name:'zigbeechannel', includeIfNull: false)
  int zigbeeChannel;

  /// This parameter uniquely identifies the hardware model of the bridge (BSB001, BSB002).
  @JsonKey(name:'modelid', includeIfNull: false)
  String modelId;

  /// The unique bridge id. This is currently generated from the bridge Ethernet mac address.
  @JsonKey(name:'bridgeid', includeIfNull: false)
  String bridgeId;

  /// Indicates if bridge settings are factory new.
  @JsonKey(name:'factorynew', includeIfNull: false)
  bool factoryNew;

  /// If a bridge backup file has been restored on this bridge from a bridge with a different bridgeid, it will indicate that bridge id, otherwise it will be null.
  @JsonKey(name:'replacesbridgeid', includeIfNull: false)
  String replacesBridgeId;

  /// As of 1.9. Perform a touchlink action if set to true, setting to false is ignored.
  ///
  /// When set to true a touchlink procedure starts which adds the closest lamp (within range) to the ZigBee network.
  /// You can then search for new lights and lamp will show up in the bridge.
  ///  This field is Write-Only so it is not visible when retrieving the bridge Config JSON.
  @JsonKey(name:'touchlink', includeIfNull: false)
  bool touchLink;

  @JsonKey(name:'datastoreversion', includeIfNull: false)
  String dataStoreVersion;

  @JsonKey(name:'internetservices', includeIfNull: false)
  InternetServices internetServices;

  @JsonKey(includeIfNull: false)
  Backup backup;

  @JsonKey(name:'starterkitid', includeIfNull: false)
  String starterKitId;

  @JsonKey(name:'config', includeIfNull: false, fromJson: _mapFromJsonConfiguration)
  Configuration configuration;

  @JsonKey(includeIfNull: false, fromJson: _mapFromJsonLights)
  List<Light> lights;

  @JsonKey(includeIfNull: false, fromJson: _mapFromJsonGroups)
  List<Group> groups;

  @JsonKey(includeIfNull: false, fromJson: _mapFromJsonScenes)
  List<Scene> scenes;

  @JsonKey(includeIfNull: false, fromJson: _mapFromJsonSchedules)
  List<Schedule> schedules;

  @JsonKey(includeIfNull: false, fromJson: _mapFromJsonSensors)
  List<Sensor> sensors;

  @JsonKey(includeIfNull: false, fromJson: _mapFromJsonRules)
  List<Rule> rules;

  @JsonKey(name:'resourcelinks', includeIfNull: false, fromJson: _mapFromJsonResourceLinks)
  List<ResourceLink> resourceLinks;

  Configuration();

  static Configuration fromJson(Map<String, dynamic> json) => _$ConfigurationFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  Configuration toBridgeObject({String action}) {
    var configuration = new Configuration();
    configuration.proxyPort = proxyPort;
    configuration.name = name;
    //TODO: set swupdate
    configuration.proxyAddress = proxyAddress;
    configuration.linkButton = linkButton;
    configuration.ipAddress = ipAddress;
    configuration.netMask = netMask;
    configuration.gateway = gateway;
    configuration.dhcp = dhcp;
    configuration.utc = utc;
    configuration.timeZone = timeZone;
    configuration.touchLink = touchLink;
    configuration.zigbeeChannel = zigbeeChannel;
    return configuration;
  }
}

@JsonSerializable()
class UserId extends Object with _$UserIdSerializerMixin {
  String id;
  String lastUsedDate;
  DateTime get lastUsed => new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastUsedDate);
  String createDate;
  DateTime get created => new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(createDate);
  String name;

  UserId();

  factory UserId.fromJson(Map<String, dynamic> json) => _$UserIdFromJson(json);

  UserId.fromJsonManually(String id, Map<String, dynamic> json) {
    this.id = id;
    name = json['name'];
    lastUsedDate = json['last use date'];
    createDate = json['create date'];
  }
  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable()
class PortalState extends Object with _$PortalStateSerializerMixin {
  String communication;
  bool incoming;
  bool outgoing;

  @JsonKey(name: 'signedon')
  bool signedOn;

  PortalState();

  factory PortalState.fromJson(Map<String, dynamic> json) => _$PortalStateFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable()
class SoftwareUpdate extends Object with _$SoftwareUpdateSerializerMixin {
  /// Setting this flag to true lets the bridge search for software updates in the portal.
  ///
  /// After the search attempt, this flag is set back to false.
  /// Requires portal connection to update server.
  /// See software update for more information.

  @JsonKey(name:'checkforupdate', includeIfNull: false)
  bool checkForUpdate;

  @JsonKey(name:'lastchange', includeIfNull: false)
  String lastChange;

  @JsonKey(includeIfNull: false)
  String state;

  @JsonKey(includeIfNull: false)
  SoftwareUpdateBridge bridge;

  @JsonKey(name:'autoinstall', includeIfNull: false)
  AutoInstall autoInstall;

  SoftwareUpdate();

  factory SoftwareUpdate.fromJson(Map<String, dynamic> json) => _$SoftwareUpdateFromJson(json);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable()
class SoftwareUpdateBridge extends Object with _$SoftwareUpdateBridgeSerializerMixin {
  String state;

  @JsonKey(name:'lastinstall')
  String lastInstall;

  DateTime get lastInstallDate => new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastInstall);


  SoftwareUpdateBridge();

  factory SoftwareUpdateBridge.fromJson(Map<String, dynamic> json) => _$SoftwareUpdateBridgeFromJson(json);
}

@JsonSerializable()
class AutoInstall extends Object with _$AutoInstallSerializerMixin {
  bool on;

  @JsonKey(name:'updatetime')
  String updateTime;

  DateTime get updateDate => new DateFormat("'T'HH:m:s").parse(updateTime);

  AutoInstall();

  factory AutoInstall.fromJson(Map<String, dynamic> json) => _$AutoInstallFromJson(json);
}

@JsonSerializable()
class InternetServices extends Object with _$InternetServicesSerializerMixin {

  String internet;

  @JsonKey(name: 'remoteaccess')
  String remoteAccess;

  String time;
  @JsonKey(name: 'swupdate')
  String swUpdate;

  InternetServices();

  factory InternetServices.fromJson(Map<String, dynamic> json) => _$InternetServicesFromJson(json);
}

@JsonSerializable()
class Backup extends Object with _$BackupSerializerMixin {

  String status;

  @JsonKey(name: 'errorcode')
  int errorCode;

  Backup();

  factory Backup.fromJson(Map<String, dynamic> json) => _$BackupFromJson(json);
}

Configuration _mapFromJsonConfiguration(dynamic json) {
  var source = json as Map<String, dynamic>;
  return _$ConfigurationFromJson(source);
}

List<UserId> _mapFromJsonWhitelist(dynamic whiteList) {
  var source = whiteList as Map<String, dynamic>;
  var result = <UserId>[];
  for (String key in source.keys) {
    var item = new UserId.fromJsonManually(key, source[key]);
    result.add(item);
  }
  return result;
}

List<Light> _mapFromJsonLights(dynamic lights) {
  var source = lights as Map<String, dynamic>;
  var result = source.keys.map((String id) {
    final item = new Light.fromJson(source[id]);
    item.id = int.parse(id);
    return item;
  }).toList();
  return result;
}

List<Group> _mapFromJsonGroups(dynamic groups) {
  var source = groups as Map<String, dynamic>;
  var result = source.keys.map((String id) {
    final item = new Group.fromJson(source[id]);
    item.id = int.parse(id);
    return item;
  }).toList();
  return result;
}

List<Schedule> _mapFromJsonSchedules(dynamic schedules) {
  var source = schedules as Map<String, dynamic>;
  var result = source.keys.map((String id) {
    final item = new Schedule.fromJson(source[id]);
    item.id = id;
    return item;
  }).toList();
  return result;
}

List<Scene> _mapFromJsonScenes(dynamic scenes) {
  var source = scenes as Map<String, dynamic>;
  var result = source.keys.map((String id) {
    final item = new Scene.fromJson(source[id]);
    item.id = id;
    return item;
  }).toList();
  return result;
}

List<Rule> _mapFromJsonRules(dynamic rules) {
  var source = rules as Map<String, dynamic>;
  var result = source.keys.map((String id) {
    final item = new Rule.fromJson(source[id]);
    item.id = int.parse(id);
    return item;
  }).toList();
  return result;
}

List<Sensor> _mapFromJsonSensors(dynamic sensors) {
  var source = sensors as Map<String, dynamic>;
  var result = source.keys.map((String id) {
    Sensor item = new Sensor.fromJson(source[id]);
    item.id = int.parse(id);
    return item;
  }).toList();
  return result;
}

List<ResourceLink> _mapFromJsonResourceLinks(dynamic resourceLinks) {
  var source = resourceLinks as Map<String, dynamic>;
  var result = source.keys.map((String id) {
    var item = new ResourceLink.fromJson(source[id]);
    item.id = id;
    return item;
  }).toList();
  return result;
}
