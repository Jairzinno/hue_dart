// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return new Configuration()
    ..name = json['name'] as String
    ..softwareUpdate = json['softwareupdate'] == null
        ? null
        : new SoftwareUpdate.fromJson(
            json['softwareupdate'] as Map<String, dynamic>)
    ..whitelist = json['whitelist'] == null
        ? null
        : _mapFromJsonWhitelist(json['whitelist'])
    ..apiVersion = json['apiversion'] as String
    ..swVersion = json['swversion'] as String
    ..proxyAddress = json['proxyaddress'] as String
    ..proxyPort = json['proxyport'] as int
    ..linkButton = json['linkbutton'] as bool
    ..ipAddress = json['ipaddress'] as String
    ..mac = json['mac'] as String
    ..netMask = json['netmask'] as String
    ..gateway = json['gateway'] as String
    ..dhcp = json['dhcp'] as bool
    ..portalServices = json['portalservices'] as bool
    ..portalState = json['portalstate'] == null
        ? null
        : new PortalState.fromJson(json['portalstate'] as Map<String, dynamic>)
    ..utc = json['utc'] as String
    ..localTime = json['localtime'] as String
    ..timeZone = json['timezone'] as String
    ..zigbeeChannel = json['zigbeechannel'] as int
    ..modelId = json['modelid'] as String
    ..bridgeId = json['bridgeid'] as String
    ..factoryNew = json['factorynew'] as bool
    ..replacesBridgeId = json['replacesbridgeid'] as String
    ..touchLink = json['touchlink'] as bool
    ..configuration = json['config'] == null
        ? null
        : _mapFromJsonConfiguration(json['config'])
    ..lights =
        json['lights'] == null ? null : _mapFromJsonLights(json['lights'])
    ..groups =
        json['groups'] == null ? null : _mapFromJsonGroups(json['groups'])
    ..scenes =
        json['scenes'] == null ? null : _mapFromJsonScenes(json['scenes'])
    ..schedules = json['schedules'] == null
        ? null
        : _mapFromJsonSchedules(json['schedules'])
    ..sensors =
        json['sensors'] == null ? null : _mapFromJsonSensors(json['sensors'])
    ..rules = json['rules'] == null ? null : _mapFromJsonRules(json['rules'])
    ..resourceLinks = json['resourcelinks'] == null
        ? null
        : _mapFromJsonResourceLinks(json['resourcelinks']);
}

abstract class _$ConfigurationSerializerMixin {
  String get name;
  SoftwareUpdate get softwareUpdate;
  List<UserId> get whitelist;
  String get apiVersion;
  String get swVersion;
  String get proxyAddress;
  int get proxyPort;
  bool get linkButton;
  String get ipAddress;
  String get mac;
  String get netMask;
  String get gateway;
  bool get dhcp;
  bool get portalServices;
  PortalState get portalState;
  String get utc;
  String get localTime;
  String get timeZone;
  int get zigbeeChannel;
  String get modelId;
  String get bridgeId;
  bool get factoryNew;
  String get replacesBridgeId;
  bool get touchLink;
  Configuration get configuration;
  List<Light> get lights;
  List<Group> get groups;
  List<Scene> get scenes;
  List<Schedule> get schedules;
  List<Sensor> get sensors;
  List<Rule> get rules;
  List<ResourceLink> get resourceLinks;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('name', name);
    writeNotNull('softwareupdate', softwareUpdate);
    writeNotNull('whitelist', whitelist);
    writeNotNull('apiversion', apiVersion);
    writeNotNull('swversion', swVersion);
    writeNotNull('proxyaddress', proxyAddress);
    writeNotNull('proxyport', proxyPort);
    writeNotNull('linkbutton', linkButton);
    writeNotNull('ipaddress', ipAddress);
    writeNotNull('mac', mac);
    writeNotNull('netmask', netMask);
    writeNotNull('gateway', gateway);
    writeNotNull('dhcp', dhcp);
    writeNotNull('portalservices', portalServices);
    writeNotNull('portalstate', portalState);
    writeNotNull('utc', utc);
    writeNotNull('localtime', localTime);
    writeNotNull('timezone', timeZone);
    writeNotNull('zigbeechannel', zigbeeChannel);
    writeNotNull('modelid', modelId);
    writeNotNull('bridgeid', bridgeId);
    writeNotNull('factorynew', factoryNew);
    writeNotNull('replacesbridgeid', replacesBridgeId);
    writeNotNull('touchlink', touchLink);
    writeNotNull('config', configuration);
    writeNotNull('lights', lights);
    writeNotNull('groups', groups);
    writeNotNull('scenes', scenes);
    writeNotNull('schedules', schedules);
    writeNotNull('sensors', sensors);
    writeNotNull('rules', rules);
    writeNotNull('resourcelinks', resourceLinks);
    return val;
  }
}

UserId _$UserIdFromJson(Map<String, dynamic> json) {
  return new UserId()
    ..id = json['id'] as String
    ..lastUsedDate = json['lastUsedDate'] as String
    ..createDate = json['createDate'] as String
    ..name = json['name'] as String;
}

abstract class _$UserIdSerializerMixin {
  String get id;
  String get lastUsedDate;
  String get createDate;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'lastUsedDate': lastUsedDate,
        'createDate': createDate,
        'name': name
      };
}

PortalState _$PortalStateFromJson(Map<String, dynamic> json) {
  return new PortalState()
    ..communication = json['communication'] as String
    ..incoming = json['incoming'] as bool
    ..outgoing = json['outgoing'] as bool
    ..signedOn = json['signedOn'] as bool;
}

abstract class _$PortalStateSerializerMixin {
  String get communication;
  bool get incoming;
  bool get outgoing;
  bool get signedOn;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'communication': communication,
        'incoming': incoming,
        'outgoing': outgoing,
        'signedOn': signedOn
      };
}

SoftwareUpdate _$SoftwareUpdateFromJson(Map<String, dynamic> json) {
  return new SoftwareUpdate()
    ..checkForUpdate = json['checkForUpdate'] as bool
    ..updateBridge = json['updateBridge'] as bool
    ..lights = (json['lights'] as List)
        ?.map((e) =>
            e == null ? null : new Light.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..updateState = json['updateState'] as int
    ..url = json['url'] as String
    ..text = json['text'] as String
    ..notify = json['notify'] as bool;
}

abstract class _$SoftwareUpdateSerializerMixin {
  bool get checkForUpdate;
  bool get updateBridge;
  List<Light> get lights;
  int get updateState;
  String get url;
  String get text;
  bool get notify;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'checkForUpdate': checkForUpdate,
        'updateBridge': updateBridge,
        'lights': lights,
        'updateState': updateState,
        'url': url,
        'text': text,
        'notify': notify
      };
}
