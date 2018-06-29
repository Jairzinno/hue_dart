import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/light/light.dart';

class Ambiance extends Light with Model {
  @override
  String productName() => 'Ambiance Pendant';

  @override
  int icon() {
    // TODO: implement icon
  }

  @override
  List<String> types() => ['LTP001', 'LTP002', 'LTP003',
  'LTD003', 'LDT001', 'LTF002',
  'LTF001', 'LTC001', 'LTC002',
  'LTC003', 'LTD001', 'LTD002'];
}
