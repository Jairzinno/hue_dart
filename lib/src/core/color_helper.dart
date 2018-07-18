/*
The MIT License (MIT)

huepi is Copyright (c) 2013 Arnd Brugman

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import 'dart:math' as math;

class HueColor {
  num hue;
  num saturation;
  num brightness;
  num temperature;
  num ct;
  List<num> xy;
  num red;
  num green;
  num blue;

  HueColor({this.hue, this.saturation, this.brightness, this.ct, this.temperature, this.xy, this.red, this.green, this.blue});
}

class ColorHelper {
  /// checks if the [modelId] is capable of using CT
  bool isCapableOfColorTemperature(String modelId) {
    var model = modelId.substring(0,3);
    return model == 'LCT' || model == 'LLM' || model == 'LTW' || model == 'LLC020' || model == 'LST002';
  }

  /// checks if the [modelId] is capable of using xy
  bool isCapableOfXY(String modelId) {
    var model = modelId.substring(0,3);
    return model == 'LCT' || model == 'LLC' || model == 'LST' || model == 'LLM';
  }

  /// Converts rgb values to hue, saturation and brightness.
  ///
  /// returns an [HueColor] with the [red], [green], [blue] values ranging from 0 to 1 converted to
  /// hue, saturation and brightness.
  HueColor rgbToHueSaturationBrightness(num red, num green, num blue) {
    num hue, saturation, brightness;
    var min = math.min(red, math.min(green, blue));
    var max = math.max(red, math.max(green, blue));
    if (min != max) {
      if (red == max) {
        hue = (0 + ((green - blue) / (max - min))) * 60;
      } else if (green == max) {
        hue = (2 + ((blue - red) / (max - min))) * 60;
      } else {
        hue = (4 + ((red - green) / (max - min))) * 60;
      }
      saturation = (max - min) / max;
      brightness = max;
    } else { // Max == Min
      hue = 0;
      saturation = 0;
      brightness = max;
    }
    return HueColor(hue: hue, saturation: saturation, brightness: brightness, red: red, green: green, blue: blue);
  }

  /// Converts hue, saturation and brightness to rgb.
  ///
  /// returns an [HueColor] with the [hue] ranging from 0 to 360, [saturation] and [brightness] both ranging from 0 to 1 converted to
  /// red, green and blue.
  HueColor hueSaturationBrightnessToRGB(num hue, num saturation, num brightness) {
    var red, green, blue;
    if (saturation == 0) {
      red = brightness;
      green = brightness;
      blue = brightness;
    } else {
      num base = hue/60;
      var sector = base.floor() % 6;
      var fraction = base - sector;
      var p = brightness * (1 - saturation);
      var q = brightness * (1 - saturation * fraction);
      var t = brightness * (1 - saturation * (1 - fraction));
      switch (sector) {
        case 0:
          red = brightness;
          green = t;
          blue = p;
          break;
        case 1:
          red = q;
          green = brightness;
          blue = p;
          break;
        case 2:
          red = p;
          green = brightness;
          blue = t;
          break;
        case 3:
          red = p;
          green = q;
          blue = brightness;
          break;
        case 4:
          red = t;
          green = p;
          blue = brightness;
          break;
        default: // case 5:
          red = brightness;
          green = p;
          blue = q;
          break;
      }
    }
    return HueColor(hue: hue, saturation: saturation, brightness: brightness, red: red, green: green, blue: blue);
  }

  /// Converts rgb values to a color temperature.
  ///
  /// returns an [HueColor] with the [red], [green], [blue] values ranging from 0 to 1 converted to
  /// a color temperature.
  /// Approximation from https://github.com/neilbartlett/color-temperature/blob/master/index.js
  HueColor rgbToColorTemperature(num red, num green, num blue) {
    num temperature;
    var testRGB;
    var epsilon = 0.4;
    var minTemperature = 2200;
    var maxTemperature = 6500;

    while ( (maxTemperature - minTemperature) > epsilon) {
      temperature = (maxTemperature + minTemperature) / 2;
      testRGB = colorTemperatureToRGB(temperature);
      if ((testRGB.blue / testRGB.red) >= (blue / red)) {
        maxTemperature = temperature;
      } else {
        minTemperature = temperature;
      }
    }
    return HueColor(temperature: temperature.round());
  }

  /// Converts a color temperature rgb values.
  ///
  /// returns an [HueColor] with a color [temperature] ranging from 1000 to 6000 converted to red, green, blue values.
  /// Sources: http://www.tannerhelland.com/4435/convert-temperature-rgb-algorithm-code/ and
  /// https://github.com/neilbartlett/color-temperature/blob/master/index.js
  HueColor colorTemperatureToRGB(num temperature) { //
    var red, green, blue;

    temperature = temperature / 100;
    if (temperature <= 66) {
      red = /*255;*/ 165 + 90 * (temperature / 66);
    } else {
      red = temperature - 60;
      red = 329.698727466 * math.pow(red, -0.1332047592);
      if (red < 0) {
        red = 0;
      }
      if (red > 255) {
        red = 255;
      }
    }
    if (temperature <= 66) {
      green = temperature;
      green = 99.4708025861 * math.log(green) - 161.1195681661;
      if (green < 0) {
        green = 0;
      }
      if (green > 255) {
        green = 255;
      }
    } else {
      green = temperature - 60;
      green = 288.1221695283 * math.pow(green, -0.0755148492);
      if (green < 0) {
        green = 0;
      }
      if (green > 255) {
        green = 255;
      }
    }
    if (temperature >= 66) {
      blue = 255;
    } else {
      if (temperature <= 19) {
        blue = 0;
      } else {
        blue = temperature - 10;
        blue = 138.5177312231 * math.log(blue) - 305.0447927307;
        if (blue < 0) {
          blue = 0;
        }
        if (blue > 255) {
          blue = 255;
        }
      }
    }
    return HueColor(red: red/255, green: green/255, blue: blue/255, temperature: temperature);
  }

  /// Converts rgb values to xy
  ///
  /// returns an [HueColor] with the [red], [green], [blue] values ranging from 0 to 1 converted to xy
  /// Source: https://github.com/PhilipsHue/PhilipsHueSDK-iOS-OSX/blob/master/ApplicationDesignNotes/RGB%20to%20xy%20Color%20conversion.md
  HueColor rgbToXY(num red, num green, num blue) {
    // Apply gamma correction
    if (red > 0.04045) {
      red = math.pow((red + 0.055) / (1.055), 2.4);
    } else {
      red = red / 12.92;
    }
    if (green > 0.04045) {
      green = math.pow((green + 0.055) / (1.055), 2.4);
    } else {
      green = green / 12.92;
    }
    if (blue > 0.04045) {
      blue = math.pow((blue + 0.055) / (1.055), 2.4);
    } else {
      blue = blue / 12.92;
    }
    // RGB to XYZ [M] for Wide RGB D65, http://www.developers.meethue.com/documentation/color-conversions-rgb-xy
    var x = red * 0.664511 + green * 0.154324 + blue * 0.162028;
    var y = red * 0.283881 + green * 0.668433 + blue * 0.047685;
    var z = red * 0.000088 + green * 0.072310 + blue * 0.986039;
    // But we don't want Capital X,Y,Z you want lowercase [x,y] (called the color point) as per:
    if ((x + y + z) == 0) {
      return new HueColor(xy: [0, 0]);
    }
    return new HueColor(xy: [x / (x + y + z),  y / (x + y + z)]);
  }

  /// Converts xy values to red, green and blue
  ///
  /// returns a [HueColor] with the [x] and [y] with an optional [brightness] converted to red, green and blue values ranging from 0 to 1
  //. Source: https://github.com/PhilipsHue/PhilipsHueSDK-iOS-OSX/blob/master/ApplicationDesignNotes/RGB%20to%20xy%20Color%20conversion.md
  HueColor xyToRGB(num x, num y, [num brightness]){
    brightness = brightness ?? 1.0; // Default full brightness
    var z = 1.0 - x - y;
    var Y = brightness;
    var X = (Y / y) * x;
    var Z = (Y / y) * z;
    // XYZ to RGB [M]-1 for Wide RGB D65, http://www.developers.meethue.com/documentation/color-conversions-rgb-xy
    num red   =  X * 1.656492 - Y * 0.354851 - Z * 0.255038;
    num green = -X * 0.707196 + Y * 1.655397 + Z * 0.036152;
    num blue  =  X * 0.051713 - Y * 0.121364 + Z * 1.011530;
    // Limit RGB on [0..1]
    if (red > blue && red > green && red > 1.0) { // Red is too big
      green = green / red;
      blue = blue / red;
      red = 1.0;
    }
    if (red < 0) {
      red = 0;
    }
    if (green > blue && green > red && green > 1.0) { // Green is too big
      red = red / green;
      blue = blue / green;
      green = 1.0;
    }
    if (green < 0) {
      green = 0;
    }
    if (blue > red && blue > green && blue > 1.0) { // Blue is too big
      red = red / blue;
      green = green / blue;
      blue = 1.0;
    }
    if (blue < 0) {
      blue = 0;
    }
    // Apply reverse gamma correction
    if (red <= 0.0031308) {
      red = red * 12.92;
    } else {
      red = 1.055 * math.pow(red, (1.0 / 2.4)) - 0.055;
    }
    if (green <= 0.0031308) {
      green = green * 12.92;
    } else {
      green = 1.055 * math.pow(green, (1.0 / 2.4)) - 0.055;
    }
    if (blue <= 0.0031308) {
      blue = blue * 12.92;
    } else {
      blue = 1.055 * math.pow(blue, (1.0 / 2.4)) - 0.055;
    }
    // Limit RGB on [0..1]
    if (red > blue && red > green && red > 1.0) { // Red is too big
      green = green / red;
      blue = blue / red;
      red = 1.0;
    }
    if (red < 0) {
      red = 0;
    }
    if (green > blue && green > red && green > 1.0) { // Green is too big
      red = red / green;
      blue = blue / green;
      green = 1.0;
    }
    if (green < 0) {
      green = 0;
    }
    if (blue > red && blue > green && blue > 1.0) { // Blue is too big
      red = red / blue;
      green = green / blue;
      blue = 1.0;
    }
    if (blue < 0) {
      blue = 0;
    }
    return new HueColor(red: red, green: green, blue: blue);
  }

  /// Converts xy values to red, green and blue
  ///
  /// returns a [HueColor] with the [x] and [y] with an optional [brightness]
  /// for a specific [modelId] converted to red, green and blue values ranging from 0 to 1
  HueColor xyToRGBForModel(num x, num y, String modelId, [num brightness] ) {
    var gamutCorrected = gamutXYForModel(x, y, modelId);
    return xyToRGB(gamutCorrected.xy[0], gamutCorrected.xy[1], brightness);
  }

  /// Tests if the [pX],[pY] resides within the Gamut for the [modelId].
  /// Otherwise it will calculated the closest point on the Gamut and return a [HueColor] with xy ranging from 0 to 1
  /// Source: https://developers.meethue.com/documentation/supported-lights
  HueColor gamutXYForModel(num pX, num pY, String modelId) {
    modelId = modelId ?? 'LCT001'; // default hue Bulb 2012
    var modelType = modelId.substring(0,3);
    var pRed, pGreen, pBlue;
    var normDot;

    if ( ((modelType == 'LST') || (modelType == 'LLC')) && (modelId !='LLC020') && (modelId !='LLC002') && (modelId != 'LST002')) { // For LivingColors Bloom, Aura and Iris etc the triangle corners are:
      pRed = {'x': 0.704, 'y': 0.296}; // Gamut A
      pGreen = {'x': 0.2151, 'y': 0.7106};
      pBlue = {'x': 0.138, 'y': 0.080};
    } else if ( ((modelType == 'LCT') || (modelType == 'LLM')) && (modelId !='LCT010') && (modelId !='LCT014') && (modelId !='LCT011')  && (modelId !='LCT012') ) { // For the hue bulb and beyond led modules etc the corners of the triangle are:
      pRed = {'x': 0.675, 'y': 0.322}; // Gamut B
      pGreen = {'x': 0.409, 'y': 0.518};
      pBlue = {'x': 0.167, 'y': 0.040};
    } else { // Exceptions and Unknown default to
      pRed = {'x': 0.692, 'y': 0.308}; // Gamut C
      pGreen = {'x': 0.17, 'y': 0.7};
      pBlue = {'x': 0.153, 'y': 0.048};
    }

    var vbr = {'x': pRed['x'] - pBlue['x'], 'y': pRed['y'] - pBlue['y']}; // Blue to Red
    var vrg = {'x': pGreen['x'] - pRed['x'], 'y': pGreen['y'] - pRed['y']}; // Red to Green
    var vgb = {'x': pBlue['x'] - pGreen['x'], 'y': pBlue['y'] - pGreen['y']}; // Green to Blue

    var gbr = (pGreen['x'] - pBlue['x']) * vbr['y'] - (pGreen['y'] - pBlue['y']) * vbr['x']; // Sign Green on Blue to Red
    var brg = (pBlue['x'] - pRed['x']) * vrg['y'] - (pBlue['y'] - pRed['y']) * vrg['x']; // Sign Blue on Red to Green
    var rgb = (pRed['x'] - pGreen['x']) * vgb['y'] - (pRed['y'] - pGreen['y']) * vgb['x']; // Sign Red on Green to Blue

    var vbp = {'x': pX - pBlue['x'], 'y': pY - pBlue['y']}; // Blue to Point
    var vrp = {'x': pX - pRed['x'], 'y': pY - pRed['y']}; // Red to Point
    var vgp = {'x': pX - pGreen['x'], 'y': pY - pGreen['y']}; // Green to Point

    var pbr = vbp['x'] * vbr['y'] - vbp['y'] * vbr['x']; // Sign Point on Blue to Red
    var prg = vrp['x'] * vrg['y'] - vrp['y'] * vrg['x']; // Sign Point on Red to Green
    var pgb = vgp['x'] * vgb['y'] - vgp['y'] * vgb['x']; // Sign Point on Green to Blue

    if ((gbr * pbr >= 0) && (brg * prg >= 0) && (rgb * pgb >= 0)) // All Signs Match so Px,Py must be in triangle
      return new HueColor(xy: [pX, pY]);

    //  Outside Triangle, Find Closesed point on Edge or Pick Vertice...
    else if (gbr * pbr <= 0) { // Outside Blue to Red
      normDot = (vbp['x'] * vbr['x'] + vbp['y'] * vbr['y']) / (vbr['x'] * vbr['x'] + vbr['y'] * vbr['y']);
      if ((normDot >= 0.0) && (normDot <= 1.0)) // Within Edge
        return new HueColor(xy: [ pBlue['x'] + normDot * vbr['x'], pBlue['y'] + normDot * vbr['y']]);
      else if (normDot < 0.0) // Outside Edge, Pick Vertice
        return new HueColor(xy: [pBlue['x'], pBlue['y']]); // Start
      else
        return new HueColor(xy: [pRed['x'], pRed['y']]); // End
    }
    else if (brg * prg <= 0) { // Outside Red to Green
      normDot = (vrp['x'] * vrg['x'] + vrp['y'] * vrg['y']) / (vrg['x'] * vrg['x'] + vrg['y'] * vrg['y']);
      if ((normDot >= 0.0) && (normDot <= 1.0)) // Within Edge
        return new HueColor(xy: [pRed['x'] + normDot * vrg['x'], pRed['y'] + normDot * vrg['y']]);
      else if (normDot < 0.0) // Outside Edge, Pick Vertice
        return new HueColor(xy: [pRed['x'], pRed['y']]); // Start
      else
        return new HueColor(xy: [pGreen['x'], pGreen['y']]); // End
    }
    else if (rgb * pgb <= 0) { // Outside Green to Blue
      normDot = (vgp['x'] * vgb['x'] + vgp['y'] * vgb['y']) / (vgb['x'] * vgb['x'] + vgb['y'] * vgb['y']);
      if ((normDot >= 0.0) && (normDot <= 1.0)) // Within Edge
        return new HueColor(xy: [pGreen['x'] + normDot * vgb['x'], pGreen['y'] + normDot * vgb['y']]);
      else if (normDot < 0.0) // Outside Edge, Pick Vertice
        return new HueColor(xy: [pGreen['x'], pGreen['y']]); // Start
      else
        return new HueColor(xy: [pBlue['x'], pBlue['y']]); // End
    }
    return new HueColor(xy: [0,0]);
  }

  /// Converts [hue], [saturation] and [brightness] values to a color temperature
  ///
  /// returns a [HueColor] with a color temperature ranging from 2200 to 6500
  HueColor hueSaturationBrightnessToColorTemperature(num hue, num saturation, num brightness) {
    var rgb = hueSaturationBrightnessToRGB(hue, saturation, brightness);
    return rgbToColorTemperature(rgb.red, rgb.green, rgb.blue);
  }

  /// Converts a color temperature to hue, saturation and brightness values
  ///
  /// returns a [HueColor] with the hue ranging from 0 to 360, saturation and brightness both ranging from 0 to 1 converted from
  /// a color [temperature]
  HueColor colorTemperatureToHueSaturationBrightness(num temperature) {
    var rgb = colorTemperatureToRGB(temperature);
    return rgbToHueSaturationBrightness(rgb.red, rgb.green, rgb.blue);
  }

  /// Converts xy to a color temperature
  ///
  /// returns a [HueColor] with the [x] and [y] with an optional [brightness] converted to a color temperature
  HueColor xyToColorTemperature(num x, num y, [num brightness]) {
    var rgb = xyToRGB(x, y, brightness);
    return rgbToColorTemperature(rgb.red, rgb.green, rgb.blue);
  }

  /// Converts a color temperature to xy
  ///
  /// returns a [HueColor] with a color [temperature] converted to xy
  HueColor colorTemperatureToXY(num temperature) {
    var rgb = colorTemperatureToRGB(temperature);
    return rgbToXY(rgb.red, rgb.green, rgb.blue);
  }

  /// Converts a CT in Mired (micro reciprocal degree) to a color temperature
  ///
  /// returns a [HueColor] with [ct] converted to a color temperature
  HueColor ctToColorTemperature(num ct) {
    num base = 1000000 / ct;
    return new HueColor(temperature: base.round());
  }

  /// Converts a color temperature to CT in Mired (micro reciprocal degree)
  ///
  /// returns a [HueColor] with color [temperature] to CT in Mired (micro reciprocal degree)
  HueColor colorTemperatureToCT(num temperature) {
    num base = 1000000 / temperature;
    return new HueColor(ct: base.round());
  }
}
