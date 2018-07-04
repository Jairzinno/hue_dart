import 'package:args/args.dart';
import 'package:hue_dart/src/configuration/configuration.dart';
import 'package:hue_dart/src/configuration/configuration_api.dart';
import 'package:hue_dart/src/group/group.dart' hide State;
import 'package:hue_dart/src/group/group_api.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/light/light_api.dart';
import 'package:hue_dart/src/resource_link/resource_link_api.dart';
import 'package:hue_dart/src/rule/rule_api.dart';
import 'package:hue_dart/src/scene/scene.dart';
import 'package:hue_dart/src/scene/scene_api.dart';
import 'package:hue_dart/src/schedule/schedule.dart';
import 'package:hue_dart/src/schedule/schedule_api.dart';
import 'package:hue_dart/src/sensor/sensor_api.dart';


//real bridge
const String username = 'UHoFRTUaGrPGxis4F6BUsf8v4MMYxPGvcy3Gw2g5';
const String address = 'http://192.168.2.1';

//emulator
//const String username = 'fa0e089b733f4594efa5365169049f0';
//const String address = 'http://127.0.0.1:8000';

const action_name = 'action';
const id_name = 'id';
ArgResults argResults;

main(List<String> arguments) async {
  var api = new SensorApi(address, username);
  var result;
  try {
    var group = _group();
    var light = _light();
    var schedule = _schedule();
    var scene = _scene();

    result = await api.single('1');
  } catch (e) {
    print("Exception occurred: $e");
  }
  var label = 'Test';
  print('===$label===');
  print(result);
  print('===End $label===');
}

void _group() {
  Group group = new Group();
  group.id = 4;
  group.name = "Test Updated Group";
  group.lights = <Light>[new Light.withId('1'), new Light.withId('2'), new Light.withId('3')];
  Action action = new Action();
  action.on = true;
  group.action = action;
}

Light _light() {
  final light = new Light.withId('4');
  light.name = 'Crazy Name';
  State state = new State();
  state.on = true;
  state.brightness = 200;
  light.state = state;
  return light;
}

_schedule() {
  final schedule = new Schedule();
  schedule.id = '2';
  schedule.name = "new schedule";
//  schedule.description = 'description';
//  schedule.time = '2012-10-29T12:00:00';
  final command = new Command();
  command.address = '/api/newdeveloper/groups/0/action';
  command.body = {
    'scene' : 'null',
    'on' : false
  };
  command.method = 'PUT';
  schedule.command = command;
  return schedule;
}

_scene() {
  final scene = new Scene();
  scene.name = 'scene-1-on';
  scene.recycle = false;
  scene.lights = [new Light.withId('1'), new Light.withId('2')];
  return scene;
}

