import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/light/light.dart';

class Phoenix extends Light with ModelMixin {
  @override
  String productName() {
    Map<String, String> mapping = {
      "HML001": "Centerpiece",
      "HML002": "Ceiling",
      "HML003": "Pendant",
      "HML004": "Wall",
      "HML005": "Table",
      "HML006": "Downlight"
    };
    return "Hue Phoenix ${mapping[modelId]}";
  }

  @override
  List<String> types() => ["HML001", "HML002", "HML003", "HML004", "HML005", "HML006"];

  @override
  int icon() {
    // TODO: implement icon
  }
}
