import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';

part 'internet_services.g.dart';

abstract class InternetServices
    implements Built<InternetServices, InternetServicesBuilder> {
  String get internet;

  @BuiltValueField(wireName: 'remoteaccess')
  String get remoteAccess;

  String get time;

  @BuiltValueField(wireName: 'swupdate')
  String get swUpdate;

  static Serializer<InternetServices> get serializer =>
      _$internetServicesSerializer;

  InternetServices._();

  factory InternetServices([updates(InternetServicesBuilder b)?]) =
      _$InternetServices;

  factory InternetServices.fromJson(Map json) {
    return serializers.deserializeWith(InternetServices.serializer, json)!;
  }
}
