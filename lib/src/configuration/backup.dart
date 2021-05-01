import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'backup.g.dart';

abstract class BackUp implements Built<BackUp, BackUpBuilder> {
  String get status;

  @BuiltValueField(wireName: 'errorcode')
  int get errorCode;

  static Serializer<BackUp> get serializer => _$backUpSerializer;

  factory BackUp([Function(BackUpBuilder b) updates]) = _$BackUp;

  BackUp._();

  factory BackUp.fromJson(Map json) {
    return serializers.deserializeWith(BackUp.serializer, json)!;
  }
}
