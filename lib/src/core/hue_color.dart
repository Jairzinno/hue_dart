import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'hue_color.g.dart';

abstract class HueColor implements Built<HueColor, HueColorBuilder> {
  /// range is 0..65535

  num? get hue;

  /// range is 0..255

  num? get saturation;

  /// range is 0..255

  num? get brightness;

  /// range is 2200..6500

  num? get temperature;

  /// Ct = 10^6 / color temperature, range is 153 (6500K) to 500 (2000K)

  num? get ct;

  /// range is [0..1, 0..1]

  BuiltList<num>? get xy;

  /// range is 0..1

  num? get red;

  /// range is 0..1

  num? get green;

  ///  range is 0..1

  num? get blue;

  static Serializer<HueColor> get serializer => _$hueColorSerializer;

  factory HueColor([Function(HueColorBuilder b) updates]) = $HueColor;

  HueColor._();

  factory HueColor.fromJson(Map json) {
    return serializers.deserializeWith(HueColor.serializer, json)!;
  }
}
