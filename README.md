# hue_dart

A library for creating Philips Hue apps in Flutter and/or AngularDart. 

This library aims to make it easier to handle with the Philips Hue bridge.

## Using
### Discovery
Import the library and search for bridges. 

```dart
import 'package:http/http.dart';
import 'package:hue_dart/hue_dart.dart';

final client = Client();
final discovery = BridgeDiscovery(client);

List<DiscoveryResult> discoverResults = await discovery.automatic();
final discoveryResult = discoverResults.first;

final bridge = Bridge(client, discoveryResult.ipAddress);
```

For web, use the `BrowserClient`.

```dart
import 'package:http/browser_client.dart';
import 'package:hue_dart/hue_dart.dart';

final client = BrowserClient();
final discovery = BridgeDiscovery(client);

List<DiscoveryResult> discoverResults = await discovery.automatic();
final discoveryResult = discoverResults.first;

final bridge = Bridge(client, discoveryResult.ipAddress);
```

Searching for a bridge by entering an IP address is also supported.

```dart
import package:hue_dart/hue.dart;

final client = Client();
final discovery = BridgeDiscovery(client);

DiscoveryResult discoverResult = await discovery.manual('192.168.1.2');

final bridge = Bridge(client, discoveryResult.ipAddress);
```

### Create a new user

To create a user press the push link button before calling the `createUser` method 
```dart
final bridge = Bridge(client, discoveryResult.ipAddress);
final whiteListItem = bridge.createUser('hue_dart');
bridge.username = whiteListItem.username;
```

### Lights
To get the current lights on the bridge, create a `Bridge`, set a username and 
```dart
final lights = bridge.lights();
```

Changing a light's color while respecting its current color mode is done by using the `Light#changeColor` method.

```dart
final light = lights.first;
light.changeColor(red: 1.0, green: 0.3, blue: 1.0);
await bridge.updateLightState(light);
```

Different light state attributes can also be changed.
```dart
final light = lights.first;
light.state.brightness = 100;
await bridge.updateLightState(light);
```

To get the light's current color in rgb values (and other known means) use the `Light#colors` method
```dart
final light = lights.first;
HueColor colors = light.colors();
print('red:${colors.red}, green: ${colors.green}, blue:${colors.blue}');
```

