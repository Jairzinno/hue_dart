import 'package:hue_dart/hue_dart.dart';

LightState lightStateForColorOnly(Light _light) {
  LightState state;
  if (_light.state.colorMode == 'xy') {
    state = LightState((b) => b..xy = _light.state.xy.toBuilder());
  } else if (_light.state.colorMode == 'ct') {
    state = LightState((b) => b..ct = _light.state.ct);
  } else {
    state = LightState((b) => b
      ..hue = _light.state.hue
      ..saturation = _light.state.saturation
      ..brightness = _light.state.brightness);
  }
  return state;
}

GroupAction groupActionForColorOnly(Group _group) {
  GroupAction state;
  if (_group.action.colorMode == 'xy') {
    state = GroupAction((b) => b..xy = _group.action.xy.toBuilder());
  } else if (_group.action.colorMode == 'ct') {
    state = GroupAction((b) => b..ct = _group.action.ct);
  } else {
    state = GroupAction((b) => b
      ..hue = _group.action.hue
      ..saturation = _group.action.saturation
      ..brightness = _group.action.brightness);
  }
  return state;
}
