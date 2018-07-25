import 'dart:async';


import 'package:hue_dart/src/configuration/configuration.dart';
import 'package:hue_dart/src/configuration/configuration_api.dart';
import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_response.dart';
import 'package:hue_dart/src/group/group.dart';
import 'package:hue_dart/src/group/group_api.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/light/light_api.dart';
import 'package:hue_dart/src/resource_link/resource_link.dart';
import 'package:hue_dart/src/resource_link/resource_link_api.dart';
import 'package:hue_dart/src/rule/rule.dart';
import 'package:hue_dart/src/rule/rule_api.dart';
import 'package:hue_dart/src/scene/scene.dart';
import 'package:hue_dart/src/scene/scene_api.dart';
import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:hue_dart/src/schedule/schedule_api.dart';
import 'package:hue_dart/src/sensor/sensor.dart';
import 'package:hue_dart/src/sensor/sensor_api.dart';


class Bridge {
  final ConfigurationApi _configurationApi;
  final GroupApi _groupApi;
  final LightApi _lightApi;
  final ResourceLinkApi _resourceLinkApi;
  final RuleApi _ruleApi;
  final SceneApi _sceneApi;
  final ScheduleApi _scheduleApi;
  final SensorApi _sensorApi;

  String _username;

  Bridge(BridgeClient client, [String username]) : this._withApi(
      new ConfigurationApi(client),
      new GroupApi(client),
      new LightApi(client),
      new ResourceLinkApi(client),
      new RuleApi(client),
      new SceneApi(client),
      new ScheduleApi(client),
      new SensorApi(client), username);

  Bridge._withApi(this._configurationApi , this._groupApi, this._lightApi, this._resourceLinkApi, this._ruleApi, this._sceneApi, this._scheduleApi, this._sensorApi, [String username]) {
    this.username = username;
  }

  void set username(String username) {
    this._username = username;
    _groupApi.username = username;
    _lightApi.username = username;
    _resourceLinkApi.username = username;
    _ruleApi.username = username;
    _sceneApi.username = username;
    _scheduleApi.username = username;
    _sensorApi.username = username;
  }

  Future<Configuration> completeConfiguration() async => await _configurationApi.completeConfiguration(_username);

  Future<Configuration> configuration() async => await _configurationApi.configuration(_username);

  Future<WhiteListItem> createUser(String deviceType) async => await _configurationApi.createUser(deviceType);

  Future<BridgeResponse> deleteUser(String deletingUsername) async => await _configurationApi.deleteUser(_username, deletingUsername);

  Future<BridgeResponse> updateConfiguration(Configuration configuration) async => await _configurationApi.update(_username, configuration);

  Future<List<Group>> groups() async => await _groupApi.all();

  Future<Group> group(int id) async => await _groupApi.single(id);

  Future<Group> createGroup(Group group) async => await _groupApi.create(group);

  Future<BridgeResponse> updateGroupAttributes(Group group) async => await _groupApi.attributes(group);

  Future<BridgeResponse> updateGroupState(Group group)  async => await _groupApi.state(group);

  Future<BridgeResponse> deleteGroup(Group group) async => await _groupApi.delete(group);

  Future<List<Light>> lights() async => await _lightApi.all();

  Future<Light> light(int id) async => await _lightApi.single(id);

  Future<BridgeResponse> searchLights([List<String> deviceIds = const []]) async => await _lightApi.search(deviceIds);

  Future<List<Light>> lightSearchResults() async => await _lightApi.searchResults();

  Future<BridgeResponse> updateLightAttributes(Light light) async => await _lightApi.attributes(light);

  Future<BridgeResponse> updateLightState(Light light) async => await _lightApi.state(light);

  Future<BridgeResponse> deleteLight(Light light) async => await _lightApi.delete(light);

  Future<List<ResourceLink>> resourceLinks() async => await _resourceLinkApi.all();

  Future<ResourceLink> resourceLink(String id) async => await _resourceLinkApi.single(id);

  Future<ResourceLink> createResourceLink(ResourceLink resourceLink) async => await _resourceLinkApi.create(resourceLink);

  Future<BridgeResponse> updateResourceLink(ResourceLink resourceLink) async => await _resourceLinkApi.update(resourceLink);

  Future<BridgeResponse> deleteResourceLink(ResourceLink resourceLink) async => await _resourceLinkApi.delete(resourceLink);

  Future<List<Rule>> rules() async => await _ruleApi.all();

  Future<Rule> rule(int id) async => await _ruleApi.single(id);

  Future<Rule> createRule(Rule rule) async => await _ruleApi.create(rule);

  Future<BridgeResponse> updateRule(Rule rule) async => await _ruleApi.update(rule);

  Future<BridgeResponse> deleteRule(Rule rule) async => await _ruleApi.delete(rule);

  Future<List<Scene>> scenes() async => await _sceneApi.all();

  Future<Scene> scene(String id) async => await _sceneApi.single(id);

  Future<BridgeResponse> updateSceneAttributes(Scene scene) async => await _sceneApi.attributes(scene);

  Future<BridgeResponse> updateSceneLightState(Scene scene, Light light) async => await _sceneApi.state(scene, light);

  Future<Scene> createScene(Scene scene) async => await _sceneApi.create(scene);

  Future<BridgeResponse> deleteScene(Scene scene) async => await _sceneApi.delete(scene);

  Future<List<Schedule>> schedules() async => await _scheduleApi.all();

  Future<Schedule> schedule(String id) async => await _scheduleApi.single(id);

  Future<Schedule> createSchedule(Schedule schedule) async => await _scheduleApi.create(schedule);

  Future<BridgeResponse> updateScheduleAttributes(Schedule schedule) async => await _scheduleApi.attributes(schedule);

  Future<BridgeResponse> deleteSchedule(Schedule schedule) async => await _scheduleApi.delete(schedule);

  Future<List<Sensor>> sensors() async => await _sensorApi.all();

  Future<Sensor> sensor(String id) async => await _sensorApi.single(id);

  Future<BridgeResponse> searchSensors() async => await _sensorApi.search();

  Future<List<Sensor>> sensorSearchResults() async => await _sensorApi.searchResults();

  Future<Sensor> createSensor(Sensor sensor) async => await _sensorApi.create(sensor);

  Future<BridgeResponse> updateSensorAttributes(Sensor sensor) async => await _sensorApi.attributes(sensor);

  Future<BridgeResponse> updateSensorConfig(Sensor sensor) async => await _sensorApi.config(sensor);

  Future<BridgeResponse> updateSensorState(Sensor sensor) async => await _sensorApi.state(sensor);

  Future<BridgeResponse> deleteSensor(Sensor sensor) async => await _sensorApi.delete(sensor);

}
