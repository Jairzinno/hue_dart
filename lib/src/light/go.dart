
import 'package:hue_dart/src/core/model.dart';
import 'package:hue_dart/src/light/light.dart';

class Go extends Light with Model {
  @override
  String productName() => 'Hue Go';

  @override
  List<String> types() => ['LLC020'];

  @override
  int icon() {
    // TODO: implement icon
  }

}
