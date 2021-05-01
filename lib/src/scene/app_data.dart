import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'app_data.g.dart';

abstract class AppData implements Built<AppData, AppDataBuilder> {
  /// App specific version of the data field.

  int? get version;

  /// App specific data. Free format string.

  String? get data;

  static Serializer<AppData> get serializer => _$appDataSerializer;

  AppData._();

  factory AppData([updates(AppDataBuilder b)?]) = _$AppData;

  static AppData? fromJson(Map json) {
    return serializers.deserializeWith(AppData.serializer, json);
  }
}
