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
  Iterable<Object?> serialize(Serializers serializers, Configuration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.softwareUpdate;
    if (value != null) {
      result
        ..add('swupdate2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SoftwareUpdate)));
    }
    value = object.whitelist;
    if (value != null) {
      result
        ..add('whitelist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(WhiteListItem)
            ])));
    }
    value = object.apiVersion;
    if (value != null) {
      result
        ..add('apiversion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.swVersion;
    if (value != null) {
      result
        ..add('swversion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.proxyAddress;
    if (value != null) {
      result
        ..add('proxyaddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.proxyPort;
    if (value != null) {
      result
        ..add('proxyport')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.linkButton;
    if (value != null) {
      result
        ..add('linkbutton')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ipAddress;
    if (value != null) {
      result
        ..add('ipaddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mac;
    if (value != null) {
      result
        ..add('mac')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.netMask;
    if (value != null) {
      result
        ..add('netmask')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gateway;
    if (value != null) {
      result
        ..add('gateway')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dhcp;
    if (value != null) {
      result
        ..add('dhcp')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.portalServices;
    if (value != null) {
      result
        ..add('portalservices')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.portalState;
    if (value != null) {
      result
        ..add('portalstate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PortalState)));
    }
    value = object.portalConnection;
    if (value != null) {
      result
        ..add('portalconnection')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.utc;
    if (value != null) {
      result
        ..add('UTC')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.localTime;
    if (value != null) {
      result
        ..add('localtime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeZone;
    if (value != null) {
      result
        ..add('timezone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zigbeeChannel;
    if (value != null) {
      result
        ..add('zigbeechannel')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.modelId;
    if (value != null) {
      result
        ..add('modelid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bridgeId;
    if (value != null) {
      result
        ..add('bridgeid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.factoryNew;
    if (value != null) {
      result
        ..add('factorynew')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.replacesBridgeId;
    if (value != null) {
      result
        ..add('replacesbridgeid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.touchLink;
    if (value != null) {
      result
        ..add('touchlink')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dataStoreVersion;
    if (value != null) {
      result
        ..add('datastoreversion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.internetServices;
    if (value != null) {
      result
        ..add('internetservices')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(InternetServices)));
    }
    value = object.backup;
    if (value != null) {
      result
        ..add('backup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BackUp)));
    }
    value = object.starterKitId;
    if (value != null) {
      result
        ..add('starterkitid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.configuration;
    if (value != null) {
      result
        ..add('config')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Configuration)));
    }
    value = object.lights;
    if (value != null) {
      result
        ..add('lights')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Light)])));
    }
    value = object.groups;
    if (value != null) {
      result
        ..add('groups')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Group)])));
    }
    value = object.scenes;
    if (value != null) {
      result
        ..add('scenes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Scene)])));
    }
    value = object.schedules;
    if (value != null) {
      result
        ..add('schedules')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Schedule)])));
    }
    value = object.sensors;
    if (value != null) {
      result
        ..add('sensors')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Sensor)])));
    }
    value = object.rules;
    if (value != null) {
      result
        ..add('rules')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Rule)])));
    }
    value = object.resourceLinks;
    if (value != null) {
      result
        ..add('resourcelinks')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(ResourceLink)])));
    }
    return result;
  }

  @override
  Configuration deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigurationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'swupdate2':
          result.softwareUpdate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SoftwareUpdate))!
              as SoftwareUpdate);
          break;
        case 'whitelist':
          result.whitelist.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(WhiteListItem)
              ]))!);
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
              specifiedType: const FullType(PortalState))! as PortalState);
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
                  specifiedType: const FullType(InternetServices))!
              as InternetServices);
          break;
        case 'backup':
          result.backup.replace(serializers.deserialize(value,
              specifiedType: const FullType(BackUp))! as BackUp);
          break;
        case 'starterkitid':
          result.starterKitId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'config':
          result.configuration.replace(serializers.deserialize(value,
              specifiedType: const FullType(Configuration))! as Configuration);
          break;
        case 'lights':
          result.lights.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Light)]))!);
          break;
        case 'groups':
          result.groups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Group)]))!);
          break;
        case 'scenes':
          result.scenes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Scene)]))!);
          break;
        case 'schedules':
          result.schedules.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Schedule)]))!);
          break;
        case 'sensors':
          result.sensors.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Sensor)]))!);
          break;
        case 'rules':
          result.rules.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Rule)]))!);
          break;
        case 'resourcelinks':
          result.resourceLinks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ResourceLink)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$Configuration extends Configuration {
  @override
  final String? name;
  @override
  final SoftwareUpdate? softwareUpdate;
  @override
  final BuiltMap<String, WhiteListItem>? whitelist;
  @override
  final String? apiVersion;
  @override
  final String? swVersion;
  @override
  final String? proxyAddress;
  @override
  final int? proxyPort;
  @override
  final bool? linkButton;
  @override
  final String? ipAddress;
  @override
  final String? mac;
  @override
  final String? netMask;
  @override
  final String? gateway;
  @override
  final bool? dhcp;
  @override
  final bool? portalServices;
  @override
  final PortalState? portalState;
  @override
  final String? portalConnection;
  @override
  final String? utc;
  @override
  final String? localTime;
  @override
  final String? timeZone;
  @override
  final int? zigbeeChannel;
  @override
  final String? modelId;
  @override
  final String? bridgeId;
  @override
  final bool? factoryNew;
  @override
  final String? replacesBridgeId;
  @override
  final bool? touchLink;
  @override
  final String? dataStoreVersion;
  @override
  final InternetServices? internetServices;
  @override
  final BackUp? backup;
  @override
  final String? starterKitId;
  @override
  final Configuration? configuration;
  @override
  final BuiltMap<String, Light>? lights;
  @override
  final BuiltMap<String, Group>? groups;
  @override
  final BuiltMap<String, Scene>? scenes;
  @override
  final BuiltMap<String, Schedule>? schedules;
  @override
  final BuiltMap<String, Sensor>? sensors;
  @override
  final BuiltMap<String, Rule>? rules;
  @override
  final BuiltMap<String, ResourceLink>? resourceLinks;
  DateTime? __utcDate;
  DateTime? __localTimeDate;

  factory _$Configuration([void Function(ConfigurationBuilder)? updates]) =>
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
  Configuration rebuild(void Function(ConfigurationBuilder) updates) =>
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
  _$Configuration? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SoftwareUpdateBuilder? _softwareUpdate;
  SoftwareUpdateBuilder get softwareUpdate =>
      _$this._softwareUpdate ??= new SoftwareUpdateBuilder();
  set softwareUpdate(SoftwareUpdateBuilder? softwareUpdate) =>
      _$this._softwareUpdate = softwareUpdate;

  MapBuilder<String, WhiteListItem>? _whitelist;
  MapBuilder<String, WhiteListItem> get whitelist =>
      _$this._whitelist ??= new MapBuilder<String, WhiteListItem>();
  set whitelist(MapBuilder<String, WhiteListItem>? whitelist) =>
      _$this._whitelist = whitelist;

  String? _apiVersion;
  String? get apiVersion => _$this._apiVersion;
  set apiVersion(String? apiVersion) => _$this._apiVersion = apiVersion;

  String? _swVersion;
  String? get swVersion => _$this._swVersion;
  set swVersion(String? swVersion) => _$this._swVersion = swVersion;

  String? _proxyAddress;
  String? get proxyAddress => _$this._proxyAddress;
  set proxyAddress(String? proxyAddress) => _$this._proxyAddress = proxyAddress;

  int? _proxyPort;
  int? get proxyPort => _$this._proxyPort;
  set proxyPort(int? proxyPort) => _$this._proxyPort = proxyPort;

  bool? _linkButton;
  bool? get linkButton => _$this._linkButton;
  set linkButton(bool? linkButton) => _$this._linkButton = linkButton;

  String? _ipAddress;
  String? get ipAddress => _$this._ipAddress;
  set ipAddress(String? ipAddress) => _$this._ipAddress = ipAddress;

  String? _mac;
  String? get mac => _$this._mac;
  set mac(String? mac) => _$this._mac = mac;

  String? _netMask;
  String? get netMask => _$this._netMask;
  set netMask(String? netMask) => _$this._netMask = netMask;

  String? _gateway;
  String? get gateway => _$this._gateway;
  set gateway(String? gateway) => _$this._gateway = gateway;

  bool? _dhcp;
  bool? get dhcp => _$this._dhcp;
  set dhcp(bool? dhcp) => _$this._dhcp = dhcp;

  bool? _portalServices;
  bool? get portalServices => _$this._portalServices;
  set portalServices(bool? portalServices) =>
      _$this._portalServices = portalServices;

  PortalStateBuilder? _portalState;
  PortalStateBuilder get portalState =>
      _$this._portalState ??= new PortalStateBuilder();
  set portalState(PortalStateBuilder? portalState) =>
      _$this._portalState = portalState;

  String? _portalConnection;
  String? get portalConnection => _$this._portalConnection;
  set portalConnection(String? portalConnection) =>
      _$this._portalConnection = portalConnection;

  String? _utc;
  String? get utc => _$this._utc;
  set utc(String? utc) => _$this._utc = utc;

  String? _localTime;
  String? get localTime => _$this._localTime;
  set localTime(String? localTime) => _$this._localTime = localTime;

  String? _timeZone;
  String? get timeZone => _$this._timeZone;
  set timeZone(String? timeZone) => _$this._timeZone = timeZone;

  int? _zigbeeChannel;
  int? get zigbeeChannel => _$this._zigbeeChannel;
  set zigbeeChannel(int? zigbeeChannel) =>
      _$this._zigbeeChannel = zigbeeChannel;

  String? _modelId;
  String? get modelId => _$this._modelId;
  set modelId(String? modelId) => _$this._modelId = modelId;

  String? _bridgeId;
  String? get bridgeId => _$this._bridgeId;
  set bridgeId(String? bridgeId) => _$this._bridgeId = bridgeId;

  bool? _factoryNew;
  bool? get factoryNew => _$this._factoryNew;
  set factoryNew(bool? factoryNew) => _$this._factoryNew = factoryNew;

  String? _replacesBridgeId;
  String? get replacesBridgeId => _$this._replacesBridgeId;
  set replacesBridgeId(String? replacesBridgeId) =>
      _$this._replacesBridgeId = replacesBridgeId;

  bool? _touchLink;
  bool? get touchLink => _$this._touchLink;
  set touchLink(bool? touchLink) => _$this._touchLink = touchLink;

  String? _dataStoreVersion;
  String? get dataStoreVersion => _$this._dataStoreVersion;
  set dataStoreVersion(String? dataStoreVersion) =>
      _$this._dataStoreVersion = dataStoreVersion;

  InternetServicesBuilder? _internetServices;
  InternetServicesBuilder get internetServices =>
      _$this._internetServices ??= new InternetServicesBuilder();
  set internetServices(InternetServicesBuilder? internetServices) =>
      _$this._internetServices = internetServices;

  BackUpBuilder? _backup;
  BackUpBuilder get backup => _$this._backup ??= new BackUpBuilder();
  set backup(BackUpBuilder? backup) => _$this._backup = backup;

  String? _starterKitId;
  String? get starterKitId => _$this._starterKitId;
  set starterKitId(String? starterKitId) => _$this._starterKitId = starterKitId;

  ConfigurationBuilder? _configuration;
  ConfigurationBuilder get configuration =>
      _$this._configuration ??= new ConfigurationBuilder();
  set configuration(ConfigurationBuilder? configuration) =>
      _$this._configuration = configuration;

  MapBuilder<String, Light>? _lights;
  MapBuilder<String, Light> get lights =>
      _$this._lights ??= new MapBuilder<String, Light>();
  set lights(MapBuilder<String, Light>? lights) => _$this._lights = lights;

  MapBuilder<String, Group>? _groups;
  MapBuilder<String, Group> get groups =>
      _$this._groups ??= new MapBuilder<String, Group>();
  set groups(MapBuilder<String, Group>? groups) => _$this._groups = groups;

  MapBuilder<String, Scene>? _scenes;
  MapBuilder<String, Scene> get scenes =>
      _$this._scenes ??= new MapBuilder<String, Scene>();
  set scenes(MapBuilder<String, Scene>? scenes) => _$this._scenes = scenes;

  MapBuilder<String, Schedule>? _schedules;
  MapBuilder<String, Schedule> get schedules =>
      _$this._schedules ??= new MapBuilder<String, Schedule>();
  set schedules(MapBuilder<String, Schedule>? schedules) =>
      _$this._schedules = schedules;

  MapBuilder<String, Sensor>? _sensors;
  MapBuilder<String, Sensor> get sensors =>
      _$this._sensors ??= new MapBuilder<String, Sensor>();
  set sensors(MapBuilder<String, Sensor>? sensors) => _$this._sensors = sensors;

  MapBuilder<String, Rule>? _rules;
  MapBuilder<String, Rule> get rules =>
      _$this._rules ??= new MapBuilder<String, Rule>();
  set rules(MapBuilder<String, Rule>? rules) => _$this._rules = rules;

  MapBuilder<String, ResourceLink>? _resourceLinks;
  MapBuilder<String, ResourceLink> get resourceLinks =>
      _$this._resourceLinks ??= new MapBuilder<String, ResourceLink>();
  set resourceLinks(MapBuilder<String, ResourceLink>? resourceLinks) =>
      _$this._resourceLinks = resourceLinks;

  ConfigurationBuilder();

  ConfigurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _softwareUpdate = $v.softwareUpdate?.toBuilder();
      _whitelist = $v.whitelist?.toBuilder();
      _apiVersion = $v.apiVersion;
      _swVersion = $v.swVersion;
      _proxyAddress = $v.proxyAddress;
      _proxyPort = $v.proxyPort;
      _linkButton = $v.linkButton;
      _ipAddress = $v.ipAddress;
      _mac = $v.mac;
      _netMask = $v.netMask;
      _gateway = $v.gateway;
      _dhcp = $v.dhcp;
      _portalServices = $v.portalServices;
      _portalState = $v.portalState?.toBuilder();
      _portalConnection = $v.portalConnection;
      _utc = $v.utc;
      _localTime = $v.localTime;
      _timeZone = $v.timeZone;
      _zigbeeChannel = $v.zigbeeChannel;
      _modelId = $v.modelId;
      _bridgeId = $v.bridgeId;
      _factoryNew = $v.factoryNew;
      _replacesBridgeId = $v.replacesBridgeId;
      _touchLink = $v.touchLink;
      _dataStoreVersion = $v.dataStoreVersion;
      _internetServices = $v.internetServices?.toBuilder();
      _backup = $v.backup?.toBuilder();
      _starterKitId = $v.starterKitId;
      _configuration = $v.configuration?.toBuilder();
      _lights = $v.lights?.toBuilder();
      _groups = $v.groups?.toBuilder();
      _scenes = $v.scenes?.toBuilder();
      _schedules = $v.schedules?.toBuilder();
      _sensors = $v.sensors?.toBuilder();
      _rules = $v.rules?.toBuilder();
      _resourceLinks = $v.resourceLinks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Configuration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Configuration;
  }

  @override
  void update(void Function(ConfigurationBuilder)? updates) {
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
      late String _$failedField;
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
