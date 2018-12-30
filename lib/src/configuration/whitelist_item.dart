import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:intl/intl.dart';

part 'whitelist_item.g.dart';

abstract class WhiteListItem implements Built<WhiteListItem, WhiteListItemBuilder> {

  @nullable
  String get username;

  @BuiltValueField(wireName: 'last use date')
  @nullable
  String get lastUsedDate;

  @memoized
  DateTime get lastUsed =>
      new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(lastUsedDate);

  @BuiltValueField(wireName: 'create date')
  @nullable
  String get createDate;

  @memoized
  DateTime get created =>
      new DateFormat("yyyy-MM-dd'T'HH:m:s").parse(createDate);
  
  @nullable
  String get name;  

  static Serializer<WhiteListItem> get serializer => _$whiteListItemSerializer;

  WhiteListItem._();

  factory WhiteListItem([updates(WhiteListItemBuilder b)]) = _$WhiteListItem;

  factory WhiteListItem.fromJson(Map json) {
    return serializers.deserializeWith(
      WhiteListItem.serializer, json
    );
  }
}