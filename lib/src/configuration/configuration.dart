import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/configuration/backup.dart';
import 'package:hue_dart/src/configuration/internet_services.dart';
import 'package:hue_dart/src/configuration/portal_state.dart';
import 'package:hue_dart/src/configuration/software_update.dart';
import 'package:hue_dart/src/configuration/whitelist_item.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';
import 'package:hue_dart/src/rule/rule.dart';
import 'package:hue_dart/src/scene/scene.dart';
import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:hue_dart/src/sensor/sensor.dart';
import 'package:intl/intl.dart';

part 'configuration.g.dart';

abstract class Configuration
    with BridgeObject
    implements Built<Configuration, ConfigurationBuilder> {
  String? get name;

  /// Contains information related to software updates.

  @BuiltValueField(wireName: 'swupdate2')
  SoftwareUpdate? get softwareUpdate;

  /// A list of whitelisted user IDs.

  BuiltMap<String, WhiteListItem>? get whitelist;

  /// The version of the hue API in the format <major>.<minor>.<patch>, for example 1.2.1

  @BuiltValueField(wireName: 'apiversion')
  String? get apiVersion;

  /// Software version of the bridge.

  @BuiltValueField(wireName: 'swversion')
  String? get swVersion;

  /// IP Address of the proxy server being used. A value of “none” indicates no proxy.

  @BuiltValueField(wireName: 'proxyaddress')
  String? get proxyAddress;

  /// Port of the proxy being used by the bridge. If set to 0 then a proxy is not being used.

  @BuiltValueField(wireName: 'proxyport')
  int? get proxyPort;

  /// Indicates whether the link button has been pressed within the last 30 seconds.

  @BuiltValueField(wireName: 'linkbutton')
  bool? get linkButton;

  /// IP address of the bridge.

  @BuiltValueField(wireName: 'ipaddress')
  String? get ipAddress;

  /// MAC address of the bridge.

  String? get mac;

  /// Network mask of the bridge.

  @BuiltValueField(wireName: 'netmask')
  String? get netMask;

  /// Gateway IP address of the bridge.

  String? get gateway;

  /// Whether the IP address of the bridge is obtained with DHCP.

  bool? get dhcp;

  /// This indicates whether the bridge is registered to synchronize data with a portal account.

  @BuiltValueField(wireName: 'portalservices')
  bool? get portalServices;

  @BuiltValueField(wireName: 'portalstate')
  PortalState? get portalState;

  @BuiltValueField(wireName: 'portalconnection')
  String? get portalConnection;

  /// Current time stored on the bridge.

  @BuiltValueField(wireName: 'UTC')
  String? get utc;

  @memoized
  DateTime get utcDate => DateFormat("yyyy-MM-dd'T'HH:m:s").parse(utc!);

  /// The local time of the bridge. "none" if not available.

  @BuiltValueField(wireName: 'localtime')
  String? get localTime;

  @memoized
  DateTime get localTimeDate =>
      DateFormat("yyyy-MM-dd'T'HH:m:s").parse(localTime!);

  /// Timezone of the bridge as OlsenIDs, like "Europe/Amsterdam" or "none" when not configured.

  @BuiltValueField(wireName: 'timezone')
  String? get timeZone;

  /// The current wireless frequency channel used by the bridge. It can take values of 11, 15, 20,25 or 0 if undefined (factory new).

  @BuiltValueField(wireName: 'zigbeechannel')
  int? get zigbeeChannel;

  /// This parameter uniquely identifies the hardware model of the bridge (BSB001, BSB002).

  @BuiltValueField(wireName: 'modelid')
  String? get modelId;

  /// The unique bridge id. This is currently generated from the bridge Ethernet mac address.

  @BuiltValueField(wireName: 'bridgeid')
  String? get bridgeId;

  /// Indicates if bridge settings are factory new.

  @BuiltValueField(wireName: 'factorynew')
  bool? get factoryNew;

  /// If a bridge backup file has been restored on this bridge from a bridge with a different bridgeid, it will indicate that bridge id, otherwise it will be null.

  @BuiltValueField(wireName: 'replacesbridgeid')
  String? get replacesBridgeId;

  /// As of 1.9. Perform a touchlink action if set to true, setting to false is ignored.
  ///
  /// When set to true a touchlink procedure starts which adds the closest lamp (within range) to the ZigBee network.
  /// You can then search for new lights and lamp will show up in the bridge.
  ///  This field is Write-Only so it is not visible when retrieving the bridge Config JSON.

  @BuiltValueField(wireName: 'touchlink')
  bool? get touchLink;

  @BuiltValueField(wireName: 'datastoreversion')
  String? get dataStoreVersion;

  @BuiltValueField(wireName: 'internetservices')
  InternetServices? get internetServices;

  BackUp? get backup;

  @BuiltValueField(wireName: 'starterkitid')
  String? get starterKitId;

  @BuiltValueField(wireName: 'config')
  Configuration? get configuration;

  BuiltMap<String, Light>? get lights;

  BuiltMap<String, Group>? get groups;

  BuiltMap<String, Scene>? get scenes;

  BuiltMap<String, Schedule>? get schedules;

  BuiltMap<String, Sensor>? get sensors;

  BuiltMap<String, Rule>? get rules;

  @BuiltValueField(wireName: 'resourcelinks')
  BuiltMap<String, ResourceLink>? get resourceLinks;

  static Serializer<Configuration> get serializer => _$configurationSerializer;

  factory Configuration([Function(ConfigurationBuilder b) updates]) =
      $Configuration;

  Configuration._();

  factory Configuration.fromJson(Map json) {
    return serializers.deserializeWith(Configuration.serializer, json)!;
  }

  @override
  Map toBridgeObject({String? action}) {
    return serializers.serializeWith(
      Configuration.serializer,
      rebuild(
        (c) => c
          ..proxyPort = proxyPort
          ..name = name
          ..proxyAddress = proxyAddress
          ..linkButton = linkButton
          ..ipAddress = ipAddress
          ..netMask = netMask
          ..gateway = gateway
          ..dhcp = dhcp
          ..utc = utc
          ..timeZone = timeZone
          ..touchLink = touchLink
          ..zigbeeChannel = zigbeeChannel,
      ),
    )! as Map<String, dynamic>;
  }
}
