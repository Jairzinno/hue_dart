import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class Beyond extends Light with ModelMixin {
  @override
  String productName() {
    String productName = 'Hue Beyond Table';
    if ('HBL002' == modelId) {
      productName = 'Hue Beyond Pendant';
    } else if ('HBL003' == modelId) {
      productName = 'Hue Beyond Ceiling';
    }
    return productName;
  }

  @override
  List<String> types() => ['HBL001', 'HBL002', 'HBL003'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
