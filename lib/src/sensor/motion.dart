import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class Motion extends Sensor with Model {
  @override
  String productName() => 'Hue Motion Sensor';

  @override
  List<String> types() => ['SML001'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
