import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:intl/intl.dart';

part 'auto_install.g.dart';

abstract class AutoInstall implements Built<AutoInstall, AutoInstallBuilder> {
  bool? get on;

  @BuiltValueField(wireName: 'updatetime')
  String? get updateTime;

  @memoized
  DateTime get updateDate => DateFormat("'T'HH:m:s").parse(updateTime!);

  static Serializer<AutoInstall> get serializer => _$autoInstallSerializer;

  factory AutoInstall([Function(AutoInstallBuilder b) updates]) = $AutoInstall;

  AutoInstall._();

  factory AutoInstall.fromJson(Map json) {
    return serializers.deserializeWith(AutoInstall.serializer, json)!;
  }
}
