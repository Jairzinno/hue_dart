import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge.dart';
import 'package:hue_dart/src/core/bridge_client.dart';
import 'package:hue_dart/src/core/bridge_discovery.dart';
import 'package:hue_dart/src/light/light.dart';

main(List<String> arguments) async {

  final client = new Client();
  /// search for bridges
  final discovery = new BridgeDiscovery(client);

  List<DiscoveryResult> discoverResults = await discovery.automatic();
  final discoveryResult = discoverResults.first;

  //create bridge
  var bridgeClient = new BridgeClient(client, discoveryResult.ipAddress);
  var bridge = new Bridge(bridgeClient);

  /// create a user, press the push link button before calling this
  final whiteListItem = await bridge.createUser('dart_hue#example');

  // use username for consequent calls to the bridge
  bridge.username = whiteListItem.username;

  /// get lights
  List<Light> lights = await bridge.lights();

  // update light state
  final light = lights.first;
  light.state.on = true;
  light.state.brightness = 10;
  await bridge.updateLightState(light);
}
