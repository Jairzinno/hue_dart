import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge.dart';
import 'package:hue_dart/src/core/bridge_discovery.dart';
import 'package:hue_dart/src/core/discovery_result.dart';
import 'package:hue_dart/src/light/light.dart';

main(List<String> arguments) async {
  final client = Client();

  /// search for bridges
  final discovery = BridgeDiscovery(client);

  List<DiscoveryResult> discoverResults = await discovery.automatic();
  final discoveryResult = discoverResults.first;

  //create bridge
  var bridge = Bridge(client, discoveryResult.ipAddress);

  /// create a user, press the push link button before calling this
  final whiteListItem = await bridge.createUser('dart_hue#example');

  // use username for consequent calls to the bridge
  bridge.username = whiteListItem.username;

  /// get lights
  List<Light> lights = await bridge.lights();

  // update light state
  final light = lights.first;
  await bridge.updateLightState(light.rebuild((l) => l)
    ..state.rebuild(
      (s) => s
        ..on = true
        ..brightness = 10,
    ));
}
