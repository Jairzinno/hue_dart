
import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class StoryLight extends Light with ModelMixin {
  @override
  String productName() => 'Disney Living Colors';
  
  @override
  List<String> types() => ['LLC013'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
