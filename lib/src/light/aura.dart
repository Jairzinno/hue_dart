
import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class Aura extends Light with ModelMixin {

  @override
  String productName() => 'Living Colors Gen3 Aura';
  @override
  List<String> types() => ['LLC014'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
