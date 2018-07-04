import 'package:hue_dart/src/core/model_mixin.dart';
import 'package:hue_dart/src/sensor/sensor.dart';

class Tap extends Sensor with ModelMixin {
  @override
  String productName() => 'Hue Tap';

  @override
  List<String> types() => _models;

  @override
  int icon() {
    // TODO: implement icon
  }

  static List<String> _models = ['ZGPSWITCH'];

  static matchesModelId(String modelId) => _models.contains(modelId);

  Tap.fromJsonManually(String id, Map<String, dynamic> json) {
    this.id = int.parse(id);
    name = json['name'];
    type = json['type'];
    modelId = json['modelid'];
    manufacturerName = json['manufacturername'];
  }

}
