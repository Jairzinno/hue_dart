import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'hue_color.g.dart';

abstract class HueColor implements Built<HueColor, HueColorBuilder> {

  /// range is 0..65535
  @nullable
  num get hue;

  /// range is 0..255
  @nullable
  num get saturation;

  /// range is 0..255
  @nullable
  num get brightness;

  /// range is 2200..6500
  @nullable
  num get temperature;

  /// Ct = 10^6 / color temperature, range is 153 (6500K) to 500 (2000K)
  @nullable
  num get ct;

  /// range is [0..1, 0..1]
  @nullable
  BuiltList<num> get xy;

  /// range is 0..1
  @nullable
  num get red;

  /// range is 0..1
  @nullable
  num get green;

  ///  range is 0..1
  @nullable
  num get blue;

  static Serializer<HueColor> get serializer => _$hueColorSerializer;

  HueColor._();

  factory HueColor([updates(HueColorBuilder b)]) = _$HueColor;

  factory HueColor.fromJson(Map json) {
    return serializers.deserializeWith(
      HueColor.serializer, json
    );
  }
}