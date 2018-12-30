import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/configuration/auto_install.dart';
import 'package:hue_dart/src/configuration/backup.dart';
import 'package:hue_dart/src/configuration/configuration.dart';
import 'package:hue_dart/src/configuration/internet_services.dart';
import 'package:hue_dart/src/configuration/portal_state.dart';
import 'package:hue_dart/src/configuration/software_update.dart';
import 'package:hue_dart/src/configuration/software_update_bridge.dart';
import 'package:hue_dart/src/configuration/whitelist_item.dart';
import 'package:hue_dart/src/core/bridge_exception.dart';
import 'package:hue_dart/src/core/discovery_result.dart';
import 'package:hue_dart/src/core/hue_color.dart';
import 'package:hue_dart/src/group/action.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/group/group_state.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/light/light_state.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';
import 'package:hue_dart/src/rule/condition.dart';
import 'package:hue_dart/src/rule/rule.dart';
import 'package:hue_dart/src/rule/rule_action.dart';
import 'package:hue_dart/src/scene/app_data.dart';
import 'package:hue_dart/src/scene/scene.dart';
import 'package:hue_dart/src/schedule/command.dart';
import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:hue_dart/src/sensor/sensor.dart';
import 'package:hue_dart/src/sensor/sensor_config.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hue_dart/src/sensor/sensor_state.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  BridgeException,
  HueColor,
  ResourceLink,
  Rule,
  RuleAction,
  Condition,
  Sensor,
  SensorConfig,
  SensorState,
  Schedule,
  Command,
  Scene,
  AppData,
  Action,
  GroupState,
  Group,
  LightState,
  DiscoveryResult,
  Light,
  Configuration,
  AutoInstall,
  BackUp,
  InternetServices,
  PortalState,
  SoftwareUpdate,
  SoftwareUpdateBridge,
  WhiteListItem,  
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

