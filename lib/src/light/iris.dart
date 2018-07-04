
import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class Iris extends Light with ModelMixin {

  @override
  int icon() {
    // TODO: implement icon
  }

  @override
  String productName() => 'Hue Living Colors Iris';

  @override
  List<String> types() => ['LLC010', 'LLC006'];
}
