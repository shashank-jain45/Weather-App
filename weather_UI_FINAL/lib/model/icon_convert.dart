import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

IconData IconGenerator(String? iconName) {
  if (iconName == "01d") {
    return MdiIcons.weatherSunny;
  }
  if (iconName == "01n") {
    return MdiIcons.moonFull;
  }
  if (iconName == "02d") {
    return MdiIcons.weatherPartlyCloudy;
  }
  if (iconName == "02n") {
    return MdiIcons.weatherNightPartlyCloudy;
  }
  if (iconName == "03d") {
    return MdiIcons.weatherCloudy;
  }
  if (iconName == "03n") {
    return MdiIcons.weatherCloudy;
  }
  if (iconName == "04d") {
    return MdiIcons.weatherPartlyCloudy;
  }
  if (iconName == "04n") {
    return MdiIcons.weatherNightPartlyCloudy;
  }
  if (iconName == "09d") {
    return MdiIcons.weatherRainy;
  }
  if (iconName == "09n") {
    return MdiIcons.weatherRainy;
  }
  if (iconName == "10d") {
    return MdiIcons.weatherPouring;
  }
  if (iconName == "10n") {
    return MdiIcons.weatherPouring;
  }
  if (iconName == "11d") {
    return MdiIcons.weatherLightningRainy;
  }
  if (iconName == "11n") {
    return MdiIcons.weatherLightningRainy;
  }
  if (iconName == "13d") {
    return MdiIcons.weatherSnowy;
  }
  if (iconName == "13n") {
    return MdiIcons.weatherSnowy;
  }
  if (iconName == "50d") {
    return MdiIcons.weatherDust;
  }
  if (iconName == "50n") {
    return MdiIcons.weatherDust;
  }
  return Icons.abc;
}
