import 'package:hue_dart/src/light/light.dart';

abstract class LightModel {
  LightModel.withLight(Light light) {
    modelId = light.modelId;
  }

  String? modelId;
  String get productName;
}

class Ambiance extends LightModel {
  Ambiance._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'Ambiance Pendant';
}

class Aura extends LightModel {
  Aura._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'Living Colors Gen3 Aura';
}

class Beyond extends LightModel {
  Beyond._withLight(Light light) : super.withLight(light);

  @override
  String get productName {
    var productName = 'Hue Beyond Table';
    if ('HBL002' == modelId) {
      productName = 'Hue Beyond Pendant';
    } else if ('HBL003' == modelId) {
      productName = 'Hue Beyond Ceiling';
    }
    return productName;
  }
}

class Bloom extends LightModel {
  Bloom._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'Hue Living Colors Bloom';
}

class Bulb extends LightModel {
  Bulb._withLight(Light light) : super.withLight(light);

  @override
  String get productName {
    var productName = 'Hue bulb A19';
    if (LightModelFactory.isLuxBulbModel(modelId)) {
      productName = 'Hue A19 Lux';
    } else if (LightModelFactory.isAmbianceBulbModel(modelId)) {
      productName = 'Hue A19 White Ambiance';
    } else if (LightModelFactory.isWhiteBulbModel(modelId)) {
      productName = 'Hue white lamp';
    }
    return productName;
  }
}

class DownLight extends LightModel {
  DownLight._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'LCT002' == modelId ? 'Hue Spot BR30' : 'Hue BR30';
}

class Entity extends LightModel {
  Entity._withLight(Light light) : super.withLight(light);

  @override
  String get productName =>
      'HEL001' == modelId ? 'Hue Entity Table' : 'Hue Entity Pendant';
}

class Go extends LightModel {
  Go._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'Hue Go';
}

class Impulse extends LightModel {
  Impulse._withLight(Light light) : super.withLight(light);

  @override
  String get productName =>
      'HIL001' == modelId ? 'Hue Impulse Table' : 'Hue Impulse Pendant';
}

class Iris extends LightModel {
  Iris._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'Hue Living Colors Iris';
}

class LightStrip extends LightModel {
  LightStrip._withLight(Light light) : super.withLight(light);

  @override
  String get productName =>
      'LST001' == modelId ? 'Hue LightStrip' : 'Hue LightStrip Plus';
}

class Phoenix extends LightModel {
  Phoenix._withLight(Light light) : super.withLight(light);

  @override
  String get productName {
    final mapping = {
      'HML001': 'Centerpiece',
      'HML002': 'Ceiling',
      'HML003': 'Pendant',
      'HML004': 'Wall',
      'HML005': 'Table',
      'HML006': 'Downlight'
    };
    return 'Hue Phoenix ${mapping[modelId!]}';
  }
}

class Spot extends LightModel {
  Spot._withLight(Light light) : super.withLight(light);

  @override
  String get productName =>
      'LCT003' == modelId ? 'Hue Spot GU10' : 'Hue Spot GU10 White Ambiance';
}

class StoryLight extends LightModel {
  StoryLight._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'Disney Living Colors';
}

class White extends LightModel {
  White._withLight(Light light) : super.withLight(light);

  @override
  String get productName => 'White';
}

abstract class LightModelFactory {
  static LightModel? create(Light light) {
    final modelId = light.modelId;
    if (isAmbianceModel(modelId)) {
      return Ambiance._withLight(light);
    } else if (isAuraModel(modelId)) {
      return Aura._withLight(light);
    } else if (isBeyondModel(modelId)) {
      return Beyond._withLight(light);
    } else if (isBloomModel(modelId)) {
      return Bloom._withLight(light);
    } else if (isDefaultBulbModel(modelId) ||
        isLuxBulbModel(modelId) ||
        isAmbianceBulbModel(modelId) ||
        isWhiteBulbModel(modelId)) {
      return Bulb._withLight(light);
    } else if (isDownLightModel(modelId)) {
      return DownLight._withLight(light);
    } else if (isEntityModel(modelId)) {
      return Entity._withLight(light);
    } else if (isGoModel(modelId)) {
      return Go._withLight(light);
    } else if (isImpulseModel(modelId)) {
      return Impulse._withLight(light);
    } else if (isIrisModel(modelId)) {
      return Iris._withLight(light);
    } else if (isLightStripModel(modelId)) {
      return LightStrip._withLight(light);
    } else if (isPhoenixModel(modelId)) {
      return Phoenix._withLight(light);
    } else if (isSpotModel(modelId)) {
      return Spot._withLight(light);
    } else if (isStoryLightModel(modelId)) {
      return StoryLight._withLight(light);
    } else if (isWhiteModel(modelId)) {
      return White._withLight(light);
    }
    return null;
  }

  static bool isAmbianceModel(String? modelId) => [
        'LTP001',
        'LTP002',
        'LTP003',
        'LTD003',
        'LDT001',
        'LTF002',
        'LTF001',
        'LTC001',
        'LTC002',
        'LTC003',
        'LTD001',
        'LTD002'
      ].contains(modelId);

  static bool isAuraModel(String? modelId) => 'LLC014' == modelId;

  static bool isBeyondModel(String? modelId) =>
      ['HBL001', 'HBL002', 'HBL003'].contains(modelId);

  static bool isBloomModel(String? modelId) =>
      ['LLC005', 'LLC011', 'LLC012', 'LLC007'].contains(modelId);

  static bool isDefaultBulbModel(String? modelId) =>
      ['LCT001', 'LCT007', 'LCT010', 'LCT014'].contains(modelId);

  static bool isLuxBulbModel(String? modelId) =>
      ['LWB004', 'LWB006', 'LWB007'].contains(modelId);

  static bool isAmbianceBulbModel(String? modelId) =>
      ['LTW010', 'LTW001', 'LTW004', 'LTW015'].contains(modelId);

  static bool isWhiteBulbModel(String? modelId) =>
      ['LWB010', 'LWB014'].contains(modelId);

  static bool isDownLightModel(String? modelId) =>
      ['LCT011', 'LTW011', 'LCT002'].contains(modelId);

  static bool isEntityModel(String? modelId) =>
      ['HEL001', 'HEL002'].contains(modelId);

  static bool isGoModel(String? modelId) => 'LLC020' == modelId;

  static bool isImpulseModel(String? modelId) =>
      ['HIL001', 'HIL002'].contains(modelId);

  static bool isIrisModel(String? modelId) =>
      ['LLC010', 'LLC006'].contains(modelId);

  static bool isLightStripModel(String? modelId) =>
      ['LST001', 'LST002'].contains(modelId);

  static bool isPhoenixModel(String? modelId) => [
        'HML001',
        'HML002',
        'HML003',
        'HML004',
        'HML005',
        'HML006'
      ].contains(modelId);

  static bool isSpotModel(String? modelId) =>
      ['LCT003', 'LTW013', 'LTW014'].contains(modelId);

  static bool isStoryLightModel(String? modelId) => 'LLC013' == modelId;

  static bool isWhiteModel(String? modelId) =>
      ['LDF002', 'LDF001', 'LDD002', 'LDD001', 'MWM001'].contains(modelId);
}
