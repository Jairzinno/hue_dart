import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class Dimmer extends Sensor with Model {
  
  @override
  String productName() => 'Hue Wireless Dimmer';

  @override
  List<String> types() => ['RWL020', 'RWL021'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
