import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/light/light.dart';

class Impulse extends Light with Model {

  @override
  String productName() => 'HIL001' == modelId ? 'Hue Impulse Table' : 'Hue Impulse Pendant';

  @override
  List<String> types() => ['HIL001', 'HIL002'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
