import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/configuration/configuration_api.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:intl/intl.dart';

part 'whitelist_item.g.dart';

abstract class WhiteListItem
    implements Built<WhiteListItem, WhiteListItemBuilder> {
  String? get username;

  @BuiltValueField(wireName: 'last use date')
  String? get lastUsedDate;

  @memoized
  DateTime get lastUsed =>
      DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastUsedDate!);

  @BuiltValueField(wireName: 'create date')
  String? get createDate;

  @memoized
  DateTime get created => DateFormat("yyyy-MM-dd'T'HH:m:s").parse(createDate!);

  HueApiDeviceType? get name;

  static Serializer<WhiteListItem> get serializer => _$whiteListItemSerializer;

  factory WhiteListItem([Function(WhiteListItemBuilder b) updates]) =
      $WhiteListItem;

  WhiteListItem._();

  factory WhiteListItem.fromJson(Map json) {
    return serializers.deserializeWith(WhiteListItem.serializer, json)!;
  }
}
