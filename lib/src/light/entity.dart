import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class Entity extends Light with ModelMixin {

  @override
  String productName() => 'HEL001' == modelId ? 'Hue Entity Table' : 'Hue Entity Pendant';

  @override
  List<String> types() => ['HEL001', 'HEL002'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
