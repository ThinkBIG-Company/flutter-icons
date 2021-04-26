import 'package:flutter_icons/flutter_icons.dart';

import 'flutter_icon_data.dart';

class FlutterIconsHelper {
  static getIconData(iconSetName, iconName) {
    // Get codepoint
    int codePoint = 0;
    if (iconGlyphs.containsKey(iconSetName)) {
      if (iconGlyphs[iconSetName].containsKey(iconName)) {
        codePoint = iconGlyphs[iconSetName][iconName];
      }
    }

    switch (iconSetName) {
      case "AntDesign":
        return FlutterIconData.antDesign(codePoint);
      case "Entypo":
        return FlutterIconData.entypo(codePoint);
      case "EvilIcons":
        return FlutterIconData.evilIcons(codePoint);
      case "Feather":
        return FlutterIconData.feather(codePoint);
      case "FontAwesome":
        return FlutterIconData.fontAwesome(codePoint);
      case "Foundation":
        return FlutterIconData.foundation(codePoint);
      case "Ionicons":
        return FlutterIconData.ionicons(codePoint);
      case "MaterialCommunityIcons":
        return FlutterIconData.materialCommunityIcons(codePoint);
      case "MaterialIcons":
        return FlutterIconData.materialIcons(codePoint);
      case "Octicons":
        return FlutterIconData.octicons(codePoint);
      case "SimpleLineIcons":
        return FlutterIconData.simpleLineIcons(codePoint);
      case "WeatherIcons":
        return FlutterIconData.weatherIcons(codePoint);
      case "Zocial":
        return FlutterIconData.zocial(codePoint);
    }
  }

  static hasIconData(iconSetName, iconName) {
    if (iconGlyphs.containsKey(iconSetName)) {
      if (iconGlyphs[iconSetName].containsKey(iconName)) {
        return true;
      }
    }

    return false;
  }
}
