import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class Bloom extends Light with ModelMixin {

  @override
  String productName() => 'Hue Living Colors Bloom';
  
  @override
  List<String> types() => ['LLC005', 'LLC011', 'LLC012', 'LLC007'];

  @override
  int icon() {
    // TODO: implement icon
  }
}
