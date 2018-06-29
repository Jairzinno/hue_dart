import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class DayLight extends Sensor with Model {

  @override
  String productName() => 'DayLight';

  @override
  List<String> types() => ['PHDL00'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
