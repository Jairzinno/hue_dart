import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/light/light.dart';

class DownLight extends Light with Model {

  @override
  String productName() => 'LCT002' == modelId ? 'Hue Spot BR30' : 'Hue BR30';

  @override
  List<String> types() => ['LCT011', 'LTW011', 'LCT002'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
