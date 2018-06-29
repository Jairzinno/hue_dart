import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/light/light.dart';

class Entity extends Light with Model {

  @override
  String productName() => 'HEL001' == modelId ? 'Hue Entity Table' : 'Hue Entity Pendant';

  @override
  List<String> types() => ['HEL001', 'HEL002'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
