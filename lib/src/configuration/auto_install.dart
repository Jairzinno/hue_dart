import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:intl/intl.dart';

part 'auto_install.g.dart';

abstract class AutoInstall implements Built<AutoInstall, AutoInstallBuilder> {

  bool get on;

  @BuiltValueField(wireName: 'updatetime')
  String get updateTime;

  @memoized
  DateTime get updateDate => new DateFormat("'T'HH:m:s").parse(updateTime);

  static Serializer<AutoInstall> get serializer => _$autoInstallSerializer;

  AutoInstall._();

  factory AutoInstall([updates(AutoInstallBuilder b)]) = _$AutoInstall;

  factory AutoInstall.fromJson(Map json) {
    return serializers.deserializeWith(
      AutoInstall.serializer, json
    );
  }
}