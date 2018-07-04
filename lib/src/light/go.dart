
import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class Go extends Light with ModelMixin {
  @override
  String productName() => 'Hue Go';

  @override
  List<String> types() => ['LLC020'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
