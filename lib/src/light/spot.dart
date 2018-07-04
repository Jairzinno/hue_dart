import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/core/model_mixin.dart';

class Spot extends Light with ModelMixin {

  @override
  String productName() => 'LCT003' == modelId ? 'Hue Spot GU10' : 'Hue Spot GU10 White Ambiance';

  @override
  List<String> types() => ['LCT003', 'LTW013', 'LTW014'];
  
  @override
  int icon() {
    // TODO: implement icon
  }

}
