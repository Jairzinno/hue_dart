import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hue_dart/src/core/hue_color.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/color_helper.dart';
import 'package:hue_dart/src/group/action.dart';
import 'package:hue_dart/src/group/group_state.dart';
import 'package:hue_dart/src/light/light.dart';

part 'group.g.dart';

abstract class Group with BridgeObject implements Built<Group, GroupBuilder> {

  @nullable
  int get id;
  ///Type of the Group. If not provided on creation a “LightGroup” is created. Supported types:
  ///
  ///LightGroup, 1.4, Default
  ///Luminaire, 1.4, multisource luminaire
  ///LightSource, 1.4, multisource luminaire
  ///Room, 1.11, Represents a room
  @nullable
  String get type;

  ///Human readable name of the group. If name is not specified one is generated for you (default name is “Group”)
  @nullable
  String get name;

  ///As of 1.11. Category of Room types. Default is: Other.
  @BuiltValueField(wireName: 'class')
  @nullable
  String get className;

  ///The ordered set of light ids from the lights which are  in the group. This resource shall contain an array of at least one element with the exception of the “Room” type: The Room type may contain an empty lights array. Each element can appear only once. Order of lights on creation is preserved. A light id must be an existing light resource in /lights. If an invalid lights resource is given, error 7 shall be returned and the group is not created. There shall be no change in the lights.
  ///
  ///Light id can be null if a group has been automatically create by the bridge and a light source is not yet available
  @BuiltValueField(wireName: 'lights')
  @nullable
  BuiltList<String> get lightIds;

  @nullable
  BuiltList<Light> get lights;

  ///When true: Resource is automatically deleted when not referenced anymore in any resource link. Only on creation of resource. “false” when omitted.
  @nullable
  bool get recycle;

  ///As of 1.4. Uniquely identifies the hardware model of the luminaire. Only present for automatically created Luminaires.
  @nullable
  @BuiltValueField(wireName: 'modelid')
  String get modelId;

  ///As of 1.9. Unique Id in AA:BB:CC:DD format for Luminaire groups or AA:BB:CC:DD-XX format for Lightsource groups, where XX is the lightsource position.
  @nullable
  @BuiltValueField(wireName: 'uniqueid')
  String get uniqueId;

  @nullable
  GroupState get state;

  @nullable
  Action get action;

    /// get the current color of the light in all possible means by the bridge
  @memoized
  HueColor get colors {
    final colorHelper = new ColorHelper();
    if (action.colorMode == 'ct') {
      return colorHelper.ctToRGB(action.ct);
    } else if (action.colorMode == 'hs') {
      return colorHelper.hueSaturationBrightnessToRGB(
          action.hue, action.saturation, action.brightness);
    } else if (action.colorMode == 'xy') {
      return colorHelper.xyToRGB(action.xy[0], action.xy[1], action.brightness);
    }
    return null;
  }

  static Serializer<Group> get serializer => _$groupSerializer;

  Group._();

  factory Group([updates(GroupBuilder b)]) = _$Group;

  factory Group.fromJson(Map json, {int id}) {
    return serializers.deserializeWith(
      Group.serializer, json
    ).rebuild((b) => b..id = id);
  }

  @override
  Map toBridgeObject({String action}) {
    if ('create' == action) {
      return {
        'name': name,
        'class': className,
        'type': type,
        'lights': lightIds.toList()
      };
    } else if ('attributes' == action) {
      Map<String, dynamic> body = {};
      if (name != null) {
        body['name'] = name;
      }
      if (className != null) {
        body['class'] = className;
      }
      if (lightIds != null) {
        body['lights'] = lightIds.toList();
      }
      return body;
    }
    return null;
  }

  /// change the color of the group on the bridge with rgb values ranging from 0 to 1
  Group changeColor({num red = 0, num green = 0, num blue = 0}) {
    final colorHelper = new ColorHelper();
    if (action.colorMode == 'ct') {
      HueColor colors = colorHelper.rgbToCT(red, green, blue);
      return rebuild(
        (b) => b
          ..action.update(
            (a) => a..ct = colors.ct.toInt(),
          ),
      );
    } else if (action.colorMode == 'hs') {
      HueColor colors =
          colorHelper.rgbToHueSaturationBrightness(red, green, blue);
      return rebuild(
        (b) => b
          ..action.update(
            (a) => a
              ..hue = colors.hue.toInt()
              ..saturation = colors.saturation.toInt()
              ..brightness = colors.brightness.toInt(),
          ),
      );
    } else if (action.colorMode == 'xy') {
      HueColor colors = colorHelper.rgbToXY(red, green, blue);
      return rebuild(
        (b) => b
          ..action.update(
            (a) => a..xy = ListBuilder(colors.xy),
          ),
      );
    }
    return this;
  }
}
