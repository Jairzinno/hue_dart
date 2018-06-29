import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class Tap extends Sensor with Model {
  @override
  String productName() => 'Hue Tap';

  @override
  List<String> types() => ['ZGPSWITCH'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
