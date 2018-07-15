// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return new Configuration()
    ..name = json['name'] as String
    ..softwareUpdate = json['swupdate2'] == null
        ? null
        : new SoftwareUpdate.fromJson(json['swupdate2'] as Map<String, dynamic>)
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
    ..portalConnection = json['portalconnection'] as String
    ..utc = json['UTC'] as String
    ..localTime = json['localtime'] as String
    ..timeZone = json['timezone'] as String
    ..zigbeeChannel = json['zigbeechannel'] as int
    ..modelId = json['modelid'] as String
    ..bridgeId = json['bridgeid'] as String
    ..factoryNew = json['factorynew'] as bool
    ..replacesBridgeId = json['replacesbridgeid'] as String
    ..touchLink = json['touchlink'] as bool
    ..dataStoreVersion = json['datastoreversion'] as String
    ..internetServices = json['internetservices'] == null
        ? null
        : new InternetServices.fromJson(
            json['internetservices'] as Map<String, dynamic>)
    ..backup = json['backup'] == null
        ? null
        : new Backup.fromJson(json['backup'] as Map<String, dynamic>)
    ..starterKitId = json['starterkitid'] as String
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
  String get portalConnection;
  String get utc;
  String get localTime;
  String get timeZone;
  int get zigbeeChannel;
  String get modelId;
  String get bridgeId;
  bool get factoryNew;
  String get replacesBridgeId;
  bool get touchLink;
  String get dataStoreVersion;
  InternetServices get internetServices;
  Backup get backup;
  String get starterKitId;
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
    writeNotNull('swupdate2', softwareUpdate);
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
    writeNotNull('portalconnection', portalConnection);
    writeNotNull('UTC', utc);
    writeNotNull('localtime', localTime);
    writeNotNull('timezone', timeZone);
    writeNotNull('zigbeechannel', zigbeeChannel);
    writeNotNull('modelid', modelId);
    writeNotNull('bridgeid', bridgeId);
    writeNotNull('factorynew', factoryNew);
    writeNotNull('replacesbridgeid', replacesBridgeId);
    writeNotNull('touchlink', touchLink);
    writeNotNull('datastoreversion', dataStoreVersion);
    writeNotNull('internetservices', internetServices);
    writeNotNull('backup', backup);
    writeNotNull('starterkitid', starterKitId);
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
    ..signedOn = json['signedon'] as bool;
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
        'signedon': signedOn
      };
}

SoftwareUpdate _$SoftwareUpdateFromJson(Map<String, dynamic> json) {
  return new SoftwareUpdate()
    ..checkForUpdate = json['checkforupdate'] as bool
    ..lastChange = json['lastchange'] as String
    ..state = json['state'] as String
    ..bridge = json['bridge'] == null
        ? null
        : new SoftwareUpdateBridge.fromJson(
            json['bridge'] as Map<String, dynamic>)
    ..autoInstall = json['autoinstall'] == null
        ? null
        : new AutoInstall.fromJson(json['autoinstall'] as Map<String, dynamic>);
}

abstract class _$SoftwareUpdateSerializerMixin {
  bool get checkForUpdate;
  String get lastChange;
  String get state;
  SoftwareUpdateBridge get bridge;
  AutoInstall get autoInstall;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('checkforupdate', checkForUpdate);
    writeNotNull('lastchange', lastChange);
    writeNotNull('state', state);
    writeNotNull('bridge', bridge);
    writeNotNull('autoinstall', autoInstall);
    return val;
  }
}

SoftwareUpdateBridge _$SoftwareUpdateBridgeFromJson(Map<String, dynamic> json) {
  return new SoftwareUpdateBridge()
    ..state = json['state'] as String
    ..lastInstall = json['lastinstall'] as String;
}

abstract class _$SoftwareUpdateBridgeSerializerMixin {
  String get state;
  String get lastInstall;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'state': state, 'lastinstall': lastInstall};
}

AutoInstall _$AutoInstallFromJson(Map<String, dynamic> json) {
  return new AutoInstall()
    ..on = json['on'] as bool
    ..updateTime = json['updatetime'] as String;
}

abstract class _$AutoInstallSerializerMixin {
  bool get on;
  String get updateTime;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'on': on, 'updatetime': updateTime};
}

InternetServices _$InternetServicesFromJson(Map<String, dynamic> json) {
  return new InternetServices()
    ..internet = json['internet'] as String
    ..remoteAccess = json['remoteaccess'] as String
    ..time = json['time'] as String
    ..swUpdate = json['swupdate'] as String;
}

abstract class _$InternetServicesSerializerMixin {
  String get internet;
  String get remoteAccess;
  String get time;
  String get swUpdate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'internet': internet,
        'remoteaccess': remoteAccess,
        'time': time,
        'swupdate': swUpdate
      };
}

Backup _$BackupFromJson(Map<String, dynamic> json) {
  return new Backup()
    ..status = json['status'] as String
    ..errorCode = json['errorcode'] as int;
}

abstract class _$BackupSerializerMixin {
  String get status;
  int get errorCode;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'status': status, 'errorcode': errorCode};
}
