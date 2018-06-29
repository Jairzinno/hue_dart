
import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/light/light.dart';

class Bulb extends Light with Model {

  static final _defaultModels = ['LCT001', 'LCT007', 'LCT010', 'LCT014'];
  static final _luxModels = ['LWB004', 'LWB006', 'LWB007'];
  static final _ambianceModels = ['LTW010', 'LTW001', 'LTW004', 'LTW015'];
  static final _whiteModels = ['LWB010', 'LWB014'];
  
  @override
  String productName() {
    String productName = "Hue bulb A19";
    if (_luxModels.contains(modelId)) {
      productName = "Hue A19 Lux";
    } else if (_ambianceModels.contains(modelId)) {
      productName = "Hue A19 White Ambiance";
    } else if (_whiteModels.contains(modelId)) {
      productName = "Hue white lamp";
    }
    return productName;
  }

  @override
  List<String> types() {
    List<String> types = [];
    types.addAll(_defaultModels);
    types.addAll(_luxModels);
    types.addAll(_ambianceModels);
    types.addAll(_whiteModels);
    return types;
  }

  @override
  int icon() {
    // TODO: implement icon
  }

}
