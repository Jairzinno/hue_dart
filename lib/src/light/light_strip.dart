
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/core/model_mixin.dart';

class LightStrip extends Light with ModelMixin {

  @override
  String productName() => 'LST001' == modelId ? 'Hue LightStrip' : 'Hue LightStrip Plus';

  @override
  List<String> types() => ['LST001', 'LST002'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
