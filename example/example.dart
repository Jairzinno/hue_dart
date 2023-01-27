import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge.dart';
import 'package:hue_dart/src/core/bridge_discovery.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/light/light_state.dart';

Future<void> main(List<String> arguments) async {
  final client = Client();

  /// search for bridges
  final discovery = BridgeDiscovery(client);

  final discoverResults = await discovery.automatic();
  if (discoverResults.isEmpty) {
    print('No hue hub/device got discovered');
    return;
  }

  final discoveryResult = discoverResults.first;

  //create bridge
  final bridge = Bridge(client, discoveryResult.ipAddress!);

  /// create a user, press the push link button before calling this
  final whiteListItem = await bridge.createUser('dart_hue#example');

  // use username for consequent calls to the bridge
  bridge.username = whiteListItem.username!;

  /// get lights
  final lights = await bridge.lights();

  // update light state
  final light = lights.first.changeColor(red: 1.0, green: 0.5, blue: 1.0);
  final state = lightStateForColorOnly(light).rebuild(
    (s) => s
      ..on = true
      ..brightness = 10,
  );
  await bridge.updateLightState(
    light.rebuild(
      (l) => l..state = state.toBuilder(),
    ),
  );
}

LightState lightStateForColorOnly(Light light) {
  LightState state;
  if (light.state!.colorMode == 'xy') {
    state = LightState((b) => b..xy = light.state!.xy!.toBuilder());
  } else if (light.state!.colorMode == 'ct') {
    state = LightState((b) => b..ct = light.state!.ct);
  } else {
    state = LightState((b) => b
      ..hue = light.state!.hue
      ..saturation = light.state!.saturation
      ..brightness = light.state!.brightness,);
  }
  return state;
}
