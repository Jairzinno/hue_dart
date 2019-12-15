import 'package:built_collection/built_collection.dart';
import 'package:hue_dart/src/core/bridge_object.dart';
import 'package:hue_dart/src/core/color_helper.dart';
import 'package:hue_dart/src/core/hue_color.dart';
import 'package:hue_dart/src/core/serializers.dart';
import 'package:hue_dart/src/light/light_model.dart';
import 'package:hue_dart/src/light/light_state.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'light.g.dart';

abstract class Light with BridgeObject implements Built<Light, LightBuilder> {
  /// id of the light in the bridge
  @nullable
  int get id;

  /// A fixed name describing the type of light e.g. “Extended color light”.
  @nullable
  String get type;

  /// A unique, editable name given to the light.
  @nullable
  String get name;

  @nullable
  LightState get state;

  /// The hardware model of the light.
  @BuiltValueField(wireName: 'modelid')
  @nullable
  String get modelId;

  /// As of 1.4. Unique id of the device. The MAC address of the device with a unique endpoint id in the form: AA:BB:CC:DD:EE:FF:00:11-XX
  @BuiltValueField(wireName: 'uniqueid')
  @nullable
  String get uniqueId;

  /// As of 1.7. The manufacturer name.
  @BuiltValueField(wireName: 'manufacturername')
  @nullable
  String get manufacturerName;

  /// As of 1.9. Unique ID of the luminaire the light is a part of in the format: AA:BB:CC:DD-XX-YY.  AA:BB:, ... represents the hex of the luminaireid, XX the lightsource position (incremental but may contain gaps) and YY the lightpoint position (index of light in luminaire group).  A gap in the lightpoint position indicates an incomplete luminaire (light search required to discover missing light points in this case).
  @BuiltValueField(wireName: 'luminaireuniqueid')
  @nullable
  String get luminaireUniqueId;

  /// An identifier for the software version running on the light.
  @BuiltValueField(wireName: 'swversion')
  @nullable
  String get swVersion;

  @memoized
  String get productName {
    switch (modelId) {
      case "":
        return "";
      default:
        return "Hue bulb A19";
    }
  }

  /// get the current color of the light in all possible means by the bridge
  @memoized
  HueColor get colors {
    final colorHelper = ColorHelper();
    if (state.colorMode == 'ct') {
      return colorHelper.ctToRGB(state.ct);
    } else if (state.colorMode == 'hs') {
      return colorHelper.hueSaturationBrightnessToRGB(
          state.hue, state.saturation, state.brightness);
    } else if (state.colorMode == 'xy') {
      return colorHelper.xyToRGB(state.xy[0], state.xy[1], state.brightness);
    }
    return null;
  }

  @memoized
  LightModel get model => LightModelFactory.create(this);

  static Serializer<Light> get serializer => _$lightSerializer;

  Light._();

  factory Light([updates(LightBuilder b)]) = _$Light;

  factory Light.fromJson(Map json, {int id}) {
    return serializers
        .deserializeWith(Light.serializer, json)
        .rebuild((b) => b..id = id);
  }

  @override
  Map toBridgeObject({String action}) {
    if ('attributes' == action) {
      return {
        'name': name,
      };
    } else if ('state' == action) {
      return state.toBridgeObject();
    }
    return null;
  }

  /// change the color of the light on the bridge with rgb values ranging from 0 to 1
  Light changeColor({num red = 0, num green = 0, num blue = 0}) {
    final colorHelper = ColorHelper();
    if (state.colorMode == 'ct') {
      HueColor colors = colorHelper.rgbToCT(red, green, blue);
      return rebuild(
        (b) => b
          ..state.update(
            (s) => s..ct = colors.ct.toInt(),
          ),
      );
    } else if (state.colorMode == 'hs') {
      HueColor colors =
          colorHelper.rgbToHueSaturationBrightness(red, green, blue);
      return rebuild(
        (b) => b
          ..state.update(
            (s) => s
              ..hue = colors.hue.toInt()
              ..saturation = colors.saturation.toInt()
              ..brightness = colors.brightness.toInt(),
          ),
      );
    } else if (state.colorMode == 'xy') {
      HueColor colors = colorHelper.rgbToXY(red, green, blue);
      return rebuild(
        (b) => b
          ..state.update(
            (s) => s..xy = ListBuilder<double>(colors.xy),
          ),
      );
    }
    return this;
  }
}
