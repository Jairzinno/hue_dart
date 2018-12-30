// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Configuration> _$configurationSerializer =
    new _$ConfigurationSerializer();

class _$ConfigurationSerializer implements StructuredSerializer<Configuration> {
  @override
  final Iterable<Type> types = const [Configuration, _$Configuration];
  @override
  final String wireName = 'Configuration';

  @override
  Iterable serialize(Serializers serializers, Configuration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.softwareUpdate != null) {
      result
        ..add('swupdate2')
        ..add(serializers.serialize(object.softwareUpdate,
            specifiedType: const FullType(SoftwareUpdate)));
    }
    if (object.whitelist != null) {
      result
        ..add('whitelist')
        ..add(serializers.serialize(object.whitelist,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(WhiteListItem)
            ])));
    }
    if (object.apiVersion != null) {
      result
        ..add('apiversion')
        ..add(serializers.serialize(object.apiVersion,
            specifiedType: const FullType(String)));
    }
    if (object.swVersion != null) {
      result
        ..add('swversion')
        ..add(serializers.serialize(object.swVersion,
            specifiedType: const FullType(String)));
    }
    if (object.proxyAddress != null) {
      result
        ..add('proxyaddress')
        ..add(serializers.serialize(object.proxyAddress,
            specifiedType: const FullType(String)));
    }
    if (object.proxyPort != null) {
      result
        ..add('proxyport')
        ..add(serializers.serialize(object.proxyPort,
            specifiedType: const FullType(int)));
    }
    if (object.linkButton != null) {
      result
        ..add('linkbutton')
        ..add(serializers.serialize(object.linkButton,
            specifiedType: const FullType(bool)));
    }
    if (object.ipAddress != null) {
      result
        ..add('ipaddress')
        ..add(serializers.serialize(object.ipAddress,
            specifiedType: const FullType(String)));
    }
    if (object.mac != null) {
      result
        ..add('mac')
        ..add(serializers.serialize(object.mac,
            specifiedType: const FullType(String)));
    }
    if (object.netMask != null) {
      result
        ..add('netmask')
        ..add(serializers.serialize(object.netMask,
            specifiedType: const FullType(String)));
    }
    if (object.gateway != null) {
      result
        ..add('gateway')
        ..add(serializers.serialize(object.gateway,
            specifiedType: const FullType(String)));
    }
    if (object.dhcp != null) {
      result
        ..add('dhcp')
        ..add(serializers.serialize(object.dhcp,
            specifiedType: const FullType(bool)));
    }
    if (object.portalServices != null) {
      result
        ..add('portalservices')
        ..add(serializers.serialize(object.portalServices,
            specifiedType: const FullType(bool)));
    }
    if (object.portalState != null) {
      result
        ..add('portalstate')
        ..add(serializers.serialize(object.portalState,
            specifiedType: const FullType(PortalState)));
    }
    if (object.portalConnection != null) {
      result
        ..add('portalconnection')
        ..add(serializers.serialize(object.portalConnection,
            specifiedType: const FullType(String)));
    }
    if (object.utc != null) {
      result
        ..add('UTC')
        ..add(serializers.serialize(object.utc,
            specifiedType: const FullType(String)));
    }
    if (object.localTime != null) {
      result
        ..add('localtime')
        ..add(serializers.serialize(object.localTime,
            specifiedType: const FullType(String)));
    }
    if (object.timeZone != null) {
      result
        ..add('timezone')
        ..add(serializers.serialize(object.timeZone,
            specifiedType: const FullType(String)));
    }
    if (object.zigbeeChannel != null) {
      result
        ..add('zigbeechannel')
        ..add(serializers.serialize(object.zigbeeChannel,
            specifiedType: const FullType(int)));
    }
    if (object.modelId != null) {
      result
        ..add('modelid')
        ..add(serializers.serialize(object.modelId,
            specifiedType: const FullType(String)));
    }
    if (object.bridgeId != null) {
      result
        ..add('bridgeid')
        ..add(serializers.serialize(object.bridgeId,
            specifiedType: const FullType(String)));
    }
    if (object.factoryNew != null) {
      result
        ..add('factorynew')
        ..add(serializers.serialize(object.factoryNew,
            specifiedType: const FullType(bool)));
    }
    if (object.replacesBridgeId != null) {
      result
        ..add('replacesbridgeid')
        ..add(serializers.serialize(object.replacesBridgeId,
            specifiedType: const FullType(String)));
    }
    if (object.touchLink != null) {
      result
        ..add('touchlink')
        ..add(serializers.serialize(object.touchLink,
            specifiedType: const FullType(bool)));
    }
    if (object.dataStoreVersion != null) {
      result
        ..add('datastoreversion')
        ..add(serializers.serialize(object.dataStoreVersion,
            specifiedType: const FullType(String)));
    }
    if (object.internetServices != null) {
      result
        ..add('internetservices')
        ..add(serializers.serialize(object.internetServices,
            specifiedType: const FullType(InternetServices)));
    }
    if (object.backup != null) {
      result
        ..add('backup')
        ..add(serializers.serialize(object.backup,
            specifiedType: const FullType(BackUp)));
    }
    if (object.starterKitId != null) {
      result
        ..add('starterkitid')
        ..add(serializers.serialize(object.starterKitId,
            specifiedType: const FullType(String)));
    }
    if (object.configuration != null) {
      result
        ..add('config')
        ..add(serializers.serialize(object.configuration,
            specifiedType: const FullType(Configuration)));
    }
    if (object.lights != null) {
      result
        ..add('lights')
        ..add(serializers.serialize(object.lights,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Light)])));
    }
    if (object.groups != null) {
      result
        ..add('groups')
        ..add(serializers.serialize(object.groups,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Group)])));
    }
    if (object.scenes != null) {
      result
        ..add('scenes')
        ..add(serializers.serialize(object.scenes,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Scene)])));
    }
    if (object.schedules != null) {
      result
        ..add('schedules')
        ..add(serializers.serialize(object.schedules,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Schedule)])));
    }
    if (object.sensors != null) {
      result
        ..add('sensors')
        ..add(serializers.serialize(object.sensors,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Sensor)])));
    }
    if (object.rules != null) {
      result
        ..add('rules')
        ..add(serializers.serialize(object.rules,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Rule)])));
    }
    if (object.resourceLinks != null) {
      result
        ..add('resourcelinks')
        ..add(serializers.serialize(object.resourceLinks,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(ResourceLink)])));
    }

    return result;
  }

  @override
  Configuration deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigurationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'swupdate2':
          result.softwareUpdate.replace(serializers.deserialize(value,
              specifiedType: const FullType(SoftwareUpdate)) as SoftwareUpdate);
          break;
        case 'whitelist':
          result.whitelist.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(WhiteListItem)
              ])) as BuiltMap);
          break;
        case 'apiversion':
          result.apiVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'swversion':
          result.swVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'proxyaddress':
          result.proxyAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'proxyport':
          result.proxyPort = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'linkbutton':
          result.linkButton = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'ipaddress':
          result.ipAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mac':
          result.mac = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'netmask':
          result.netMask = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gateway':
          result.gateway = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dhcp':
          result.dhcp = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'portalservices':
          result.portalServices = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'portalstate':
          result.portalState.replace(serializers.deserialize(value,
              specifiedType: const FullType(PortalState)) as PortalState);
          break;
        case 'portalconnection':
          result.portalConnection = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'UTC':
          result.utc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'localtime':
          result.localTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timezone':
          result.timeZone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'zigbeechannel':
          result.zigbeeChannel = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'modelid':
          result.modelId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bridgeid':
          result.bridgeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'factorynew':
          result.factoryNew = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'replacesbridgeid':
          result.replacesBridgeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'touchlink':
          result.touchLink = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'datastoreversion':
          result.dataStoreVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'internetservices':
          result.internetServices.replace(serializers.deserialize(value,
                  specifiedType: const FullType(InternetServices))
              as InternetServices);
          break;
        case 'backup':
          result.backup.replace(serializers.deserialize(value,
              specifiedType: const FullType(BackUp)) as BackUp);
          break;
        case 'starterkitid':
          result.starterKitId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'config':
          result.configuration.replace(serializers.deserialize(value,
              specifiedType: const FullType(Configuration)) as Configuration);
          break;
        case 'lights':
          result.lights.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Light)
              ])) as BuiltMap);
          break;
        case 'groups':
          result.groups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Group)
              ])) as BuiltMap);
          break;
        case 'scenes':
          result.scenes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Scene)
              ])) as BuiltMap);
          break;
        case 'schedules':
          result.schedules.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Schedule)
              ])) as BuiltMap);
          break;
        case 'sensors':
          result.sensors.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Sensor)
              ])) as BuiltMap);
          break;
        case 'rules':
          result.rules.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Rule)
              ])) as BuiltMap);
          break;
        case 'resourcelinks':
          result.resourceLinks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ResourceLink)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$Configuration extends Configuration {
  @override
  final String name;
  @override
  final SoftwareUpdate softwareUpdate;
  @override
  final BuiltMap<String, WhiteListItem> whitelist;
  @override
  final String apiVersion;
  @override
  final String swVersion;
  @override
  final String proxyAddress;
  @override
  final int proxyPort;
  @override
  final bool linkButton;
  @override
  final String ipAddress;
  @override
  final String mac;
  @override
  final String netMask;
  @override
  final String gateway;
  @override
  final bool dhcp;
  @override
  final bool portalServices;
  @override
  final PortalState portalState;
  @override
  final String portalConnection;
  @override
  final String utc;
  @override
  final String localTime;
  @override
  final String timeZone;
  @override
  final int zigbeeChannel;
  @override
  final String modelId;
  @override
  final String bridgeId;
  @override
  final bool factoryNew;
  @override
  final String replacesBridgeId;
  @override
  final bool touchLink;
  @override
  final String dataStoreVersion;
  @override
  final InternetServices internetServices;
  @override
  final BackUp backup;
  @override
  final String starterKitId;
  @override
  final Configuration configuration;
  @override
  final BuiltMap<String, Light> lights;
  @override
  final BuiltMap<String, Group> groups;
  @override
  final BuiltMap<String, Scene> scenes;
  @override
  final BuiltMap<String, Schedule> schedules;
  @override
  final BuiltMap<String, Sensor> sensors;
  @override
  final BuiltMap<String, Rule> rules;
  @override
  final BuiltMap<String, ResourceLink> resourceLinks;
  DateTime __utcDate;
  DateTime __localTimeDate;

  factory _$Configuration([void updates(ConfigurationBuilder b)]) =>
      (new ConfigurationBuilder()..update(updates)).build();

  _$Configuration._(
      {this.name,
      this.softwareUpdate,
      this.whitelist,
      this.apiVersion,
      this.swVersion,
      this.proxyAddress,
      this.proxyPort,
      this.linkButton,
      this.ipAddress,
      this.mac,
      this.netMask,
      this.gateway,
      this.dhcp,
      this.portalServices,
      this.portalState,
      this.portalConnection,
      this.utc,
      this.localTime,
      this.timeZone,
      this.zigbeeChannel,
      this.modelId,
      this.bridgeId,
      this.factoryNew,
      this.replacesBridgeId,
      this.touchLink,
      this.dataStoreVersion,
      this.internetServices,
      this.backup,
      this.starterKitId,
      this.configuration,
      this.lights,
      this.groups,
      this.scenes,
      this.schedules,
      this.sensors,
      this.rules,
      this.resourceLinks})
      : super._();

  @override
  DateTime get utcDate => __utcDate ??= super.utcDate;

  @override
  DateTime get localTimeDate => __localTimeDate ??= super.localTimeDate;

  @override
  Configuration rebuild(void updates(ConfigurationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationBuilder toBuilder() => new ConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Configuration &&
        name == other.name &&
        softwareUpdate == other.softwareUpdate &&
        whitelist == other.whitelist &&
        apiVersion == other.apiVersion &&
        swVersion == other.swVersion &&
        proxyAddress == other.proxyAddress &&
        proxyPort == other.proxyPort &&
        linkButton == other.linkButton &&
        ipAddress == other.ipAddress &&
        mac == other.mac &&
        netMask == other.netMask &&
        gateway == other.gateway &&
        dhcp == other.dhcp &&
        portalServices == other.portalServices &&
        portalState == other.portalState &&
        portalConnection == other.portalConnection &&
        utc == other.utc &&
        localTime == other.localTime &&
        timeZone == other.timeZone &&
        zigbeeChannel == other.zigbeeChannel &&
        modelId == other.modelId &&
        bridgeId == other.bridgeId &&
        factoryNew == other.factoryNew &&
        replacesBridgeId == other.replacesBridgeId &&
        touchLink == other.touchLink &&
        dataStoreVersion == other.dataStoreVersion &&
        internetServices == other.internetServices &&
        backup == other.backup &&
        starterKitId == other.starterKitId &&
        configuration == other.configuration &&
        lights == other.lights &&
        groups == other.groups &&
        scenes == other.scenes &&
        schedules == other.schedules &&
        sensors == other.sensors &&
        rules == other.rules &&
        resourceLinks == other.resourceLinks;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, name.hashCode), softwareUpdate.hashCode), whitelist.hashCode), apiVersion.hashCode), swVersion.hashCode), proxyAddress.hashCode), proxyPort.hashCode), linkButton.hashCode), ipAddress.hashCode), mac.hashCode), netMask.hashCode), gateway.hashCode), dhcp.hashCode), portalServices.hashCode), portalState.hashCode), portalConnection.hashCode), utc.hashCode), localTime.hashCode),
                                                                                timeZone.hashCode),
                                                                            zigbeeChannel.hashCode),
                                                                        modelId.hashCode),
                                                                    bridgeId.hashCode),
                                                                factoryNew.hashCode),
                                                            replacesBridgeId.hashCode),
                                                        touchLink.hashCode),
                                                    dataStoreVersion.hashCode),
                                                internetServices.hashCode),
                                            backup.hashCode),
                                        starterKitId.hashCode),
                                    configuration.hashCode),
                                lights.hashCode),
                            groups.hashCode),
                        scenes.hashCode),
                    schedules.hashCode),
                sensors.hashCode),
            rules.hashCode),
        resourceLinks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Configuration')
          ..add('name', name)
          ..add('softwareUpdate', softwareUpdate)
          ..add('whitelist', whitelist)
          ..add('apiVersion', apiVersion)
          ..add('swVersion', swVersion)
          ..add('proxyAddress', proxyAddress)
          ..add('proxyPort', proxyPort)
          ..add('linkButton', linkButton)
          ..add('ipAddress', ipAddress)
          ..add('mac', mac)
          ..add('netMask', netMask)
          ..add('gateway', gateway)
          ..add('dhcp', dhcp)
          ..add('portalServices', portalServices)
          ..add('portalState', portalState)
          ..add('portalConnection', portalConnection)
          ..add('utc', utc)
          ..add('localTime', localTime)
          ..add('timeZone', timeZone)
          ..add('zigbeeChannel', zigbeeChannel)
          ..add('modelId', modelId)
          ..add('bridgeId', bridgeId)
          ..add('factoryNew', factoryNew)
          ..add('replacesBridgeId', replacesBridgeId)
          ..add('touchLink', touchLink)
          ..add('dataStoreVersion', dataStoreVersion)
          ..add('internetServices', internetServices)
          ..add('backup', backup)
          ..add('starterKitId', starterKitId)
          ..add('configuration', configuration)
          ..add('lights', lights)
          ..add('groups', groups)
          ..add('scenes', scenes)
          ..add('schedules', schedules)
          ..add('sensors', sensors)
          ..add('rules', rules)
          ..add('resourceLinks', resourceLinks))
        .toString();
  }
}

class ConfigurationBuilder
    implements Builder<Configuration, ConfigurationBuilder> {
  _$Configuration _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  SoftwareUpdateBuilder _softwareUpdate;
  SoftwareUpdateBuilder get softwareUpdate =>
      _$this._softwareUpdate ??= new SoftwareUpdateBuilder();
  set softwareUpdate(SoftwareUpdateBuilder softwareUpdate) =>
      _$this._softwareUpdate = softwareUpdate;

  MapBuilder<String, WhiteListItem> _whitelist;
  MapBuilder<String, WhiteListItem> get whitelist =>
      _$this._whitelist ??= new MapBuilder<String, WhiteListItem>();
  set whitelist(MapBuilder<String, WhiteListItem> whitelist) =>
      _$this._whitelist = whitelist;

  String _apiVersion;
  String get apiVersion => _$this._apiVersion;
  set apiVersion(String apiVersion) => _$this._apiVersion = apiVersion;

  String _swVersion;
  String get swVersion => _$this._swVersion;
  set swVersion(String swVersion) => _$this._swVersion = swVersion;

  String _proxyAddress;
  String get proxyAddress => _$this._proxyAddress;
  set proxyAddress(String proxyAddress) => _$this._proxyAddress = proxyAddress;

  int _proxyPort;
  int get proxyPort => _$this._proxyPort;
  set proxyPort(int proxyPort) => _$this._proxyPort = proxyPort;

  bool _linkButton;
  bool get linkButton => _$this._linkButton;
  set linkButton(bool linkButton) => _$this._linkButton = linkButton;

  String _ipAddress;
  String get ipAddress => _$this._ipAddress;
  set ipAddress(String ipAddress) => _$this._ipAddress = ipAddress;

  String _mac;
  String get mac => _$this._mac;
  set mac(String mac) => _$this._mac = mac;

  String _netMask;
  String get netMask => _$this._netMask;
  set netMask(String netMask) => _$this._netMask = netMask;

  String _gateway;
  String get gateway => _$this._gateway;
  set gateway(String gateway) => _$this._gateway = gateway;

  bool _dhcp;
  bool get dhcp => _$this._dhcp;
  set dhcp(bool dhcp) => _$this._dhcp = dhcp;

  bool _portalServices;
  bool get portalServices => _$this._portalServices;
  set portalServices(bool portalServices) =>
      _$this._portalServices = portalServices;

  PortalStateBuilder _portalState;
  PortalStateBuilder get portalState =>
      _$this._portalState ??= new PortalStateBuilder();
  set portalState(PortalStateBuilder portalState) =>
      _$this._portalState = portalState;

  String _portalConnection;
  String get portalConnection => _$this._portalConnection;
  set portalConnection(String portalConnection) =>
      _$this._portalConnection = portalConnection;

  String _utc;
  String get utc => _$this._utc;
  set utc(String utc) => _$this._utc = utc;

  String _localTime;
  String get localTime => _$this._localTime;
  set localTime(String localTime) => _$this._localTime = localTime;

  String _timeZone;
  String get timeZone => _$this._timeZone;
  set timeZone(String timeZone) => _$this._timeZone = timeZone;

  int _zigbeeChannel;
  int get zigbeeChannel => _$this._zigbeeChannel;
  set zigbeeChannel(int zigbeeChannel) => _$this._zigbeeChannel = zigbeeChannel;

  String _modelId;
  String get modelId => _$this._modelId;
  set modelId(String modelId) => _$this._modelId = modelId;

  String _bridgeId;
  String get bridgeId => _$this._bridgeId;
  set bridgeId(String bridgeId) => _$this._bridgeId = bridgeId;

  bool _factoryNew;
  bool get factoryNew => _$this._factoryNew;
  set factoryNew(bool factoryNew) => _$this._factoryNew = factoryNew;

  String _replacesBridgeId;
  String get replacesBridgeId => _$this._replacesBridgeId;
  set replacesBridgeId(String replacesBridgeId) =>
      _$this._replacesBridgeId = replacesBridgeId;

  bool _touchLink;
  bool get touchLink => _$this._touchLink;
  set touchLink(bool touchLink) => _$this._touchLink = touchLink;

  String _dataStoreVersion;
  String get dataStoreVersion => _$this._dataStoreVersion;
  set dataStoreVersion(String dataStoreVersion) =>
      _$this._dataStoreVersion = dataStoreVersion;

  InternetServicesBuilder _internetServices;
  InternetServicesBuilder get internetServices =>
      _$this._internetServices ??= new InternetServicesBuilder();
  set internetServices(InternetServicesBuilder internetServices) =>
      _$this._internetServices = internetServices;

  BackUpBuilder _backup;
  BackUpBuilder get backup => _$this._backup ??= new BackUpBuilder();
  set backup(BackUpBuilder backup) => _$this._backup = backup;

  String _starterKitId;
  String get starterKitId => _$this._starterKitId;
  set starterKitId(String starterKitId) => _$this._starterKitId = starterKitId;

  ConfigurationBuilder _configuration;
  ConfigurationBuilder get configuration =>
      _$this._configuration ??= new ConfigurationBuilder();
  set configuration(ConfigurationBuilder configuration) =>
      _$this._configuration = configuration;

  MapBuilder<String, Light> _lights;
  MapBuilder<String, Light> get lights =>
      _$this._lights ??= new MapBuilder<String, Light>();
  set lights(MapBuilder<String, Light> lights) => _$this._lights = lights;

  MapBuilder<String, Group> _groups;
  MapBuilder<String, Group> get groups =>
      _$this._groups ??= new MapBuilder<String, Group>();
  set groups(MapBuilder<String, Group> groups) => _$this._groups = groups;

  MapBuilder<String, Scene> _scenes;
  MapBuilder<String, Scene> get scenes =>
      _$this._scenes ??= new MapBuilder<String, Scene>();
  set scenes(MapBuilder<String, Scene> scenes) => _$this._scenes = scenes;

  MapBuilder<String, Schedule> _schedules;
  MapBuilder<String, Schedule> get schedules =>
      _$this._schedules ??= new MapBuilder<String, Schedule>();
  set schedules(MapBuilder<String, Schedule> schedules) =>
      _$this._schedules = schedules;

  MapBuilder<String, Sensor> _sensors;
  MapBuilder<String, Sensor> get sensors =>
      _$this._sensors ??= new MapBuilder<String, Sensor>();
  set sensors(MapBuilder<String, Sensor> sensors) => _$this._sensors = sensors;

  MapBuilder<String, Rule> _rules;
  MapBuilder<String, Rule> get rules =>
      _$this._rules ??= new MapBuilder<String, Rule>();
  set rules(MapBuilder<String, Rule> rules) => _$this._rules = rules;

  MapBuilder<String, ResourceLink> _resourceLinks;
  MapBuilder<String, ResourceLink> get resourceLinks =>
      _$this._resourceLinks ??= new MapBuilder<String, ResourceLink>();
  set resourceLinks(MapBuilder<String, ResourceLink> resourceLinks) =>
      _$this._resourceLinks = resourceLinks;

  ConfigurationBuilder();

  ConfigurationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _softwareUpdate = _$v.softwareUpdate?.toBuilder();
      _whitelist = _$v.whitelist?.toBuilder();
      _apiVersion = _$v.apiVersion;
      _swVersion = _$v.swVersion;
      _proxyAddress = _$v.proxyAddress;
      _proxyPort = _$v.proxyPort;
      _linkButton = _$v.linkButton;
      _ipAddress = _$v.ipAddress;
      _mac = _$v.mac;
      _netMask = _$v.netMask;
      _gateway = _$v.gateway;
      _dhcp = _$v.dhcp;
      _portalServices = _$v.portalServices;
      _portalState = _$v.portalState?.toBuilder();
      _portalConnection = _$v.portalConnection;
      _utc = _$v.utc;
      _localTime = _$v.localTime;
      _timeZone = _$v.timeZone;
      _zigbeeChannel = _$v.zigbeeChannel;
      _modelId = _$v.modelId;
      _bridgeId = _$v.bridgeId;
      _factoryNew = _$v.factoryNew;
      _replacesBridgeId = _$v.replacesBridgeId;
      _touchLink = _$v.touchLink;
      _dataStoreVersion = _$v.dataStoreVersion;
      _internetServices = _$v.internetServices?.toBuilder();
      _backup = _$v.backup?.toBuilder();
      _starterKitId = _$v.starterKitId;
      _configuration = _$v.configuration?.toBuilder();
      _lights = _$v.lights?.toBuilder();
      _groups = _$v.groups?.toBuilder();
      _scenes = _$v.scenes?.toBuilder();
      _schedules = _$v.schedules?.toBuilder();
      _sensors = _$v.sensors?.toBuilder();
      _rules = _$v.rules?.toBuilder();
      _resourceLinks = _$v.resourceLinks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Configuration other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Configuration;
  }

  @override
  void update(void updates(ConfigurationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Configuration build() {
    _$Configuration _$result;
    try {
      _$result = _$v ??
          new _$Configuration._(
              name: name,
              softwareUpdate: _softwareUpdate?.build(),
              whitelist: _whitelist?.build(),
              apiVersion: apiVersion,
              swVersion: swVersion,
              proxyAddress: proxyAddress,
              proxyPort: proxyPort,
              linkButton: linkButton,
              ipAddress: ipAddress,
              mac: mac,
              netMask: netMask,
              gateway: gateway,
              dhcp: dhcp,
              portalServices: portalServices,
              portalState: _portalState?.build(),
              portalConnection: portalConnection,
              utc: utc,
              localTime: localTime,
              timeZone: timeZone,
              zigbeeChannel: zigbeeChannel,
              modelId: modelId,
              bridgeId: bridgeId,
              factoryNew: factoryNew,
              replacesBridgeId: replacesBridgeId,
              touchLink: touchLink,
              dataStoreVersion: dataStoreVersion,
              internetServices: _internetServices?.build(),
              backup: _backup?.build(),
              starterKitId: starterKitId,
              configuration: _configuration?.build(),
              lights: _lights?.build(),
              groups: _groups?.build(),
              scenes: _scenes?.build(),
              schedules: _schedules?.build(),
              sensors: _sensors?.build(),
              rules: _rules?.build(),
              resourceLinks: _resourceLinks?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'softwareUpdate';
        _softwareUpdate?.build();
        _$failedField = 'whitelist';
        _whitelist?.build();

        _$failedField = 'portalState';
        _portalState?.build();

        _$failedField = 'internetServices';
        _internetServices?.build();
        _$failedField = 'backup';
        _backup?.build();

        _$failedField = 'configuration';
        _configuration?.build();
        _$failedField = 'lights';
        _lights?.build();
        _$failedField = 'groups';
        _groups?.build();
        _$failedField = 'scenes';
        _scenes?.build();
        _$failedField = 'schedules';
        _schedules?.build();
        _$failedField = 'sensors';
        _sensors?.build();
        _$failedField = 'rules';
        _rules?.build();
        _$failedField = 'resourceLinks';
        _resourceLinks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Configuration', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
