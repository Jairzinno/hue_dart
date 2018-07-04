import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class White extends Light with ModelMixin {
  @override
  String productName() => 'White';

  @override
  List<String> types() => ['LDF002', 'LDF001', 'LDD002', 'LDD001', 'MWM001'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
