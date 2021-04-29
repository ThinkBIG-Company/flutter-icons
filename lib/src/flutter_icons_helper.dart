import 'package:flutter_icons/flutter_icons.dart';

import 'flutter_icon_data.dart';

class FlutterIconsHelper {
  static getIconData(iconFamily, iconName) {
    final glyphMapName = iconFamily.split(new RegExp(r"(?<=[a-z])(?=[A-Z])"));
    var lowerGlyphMapName = '';
    if (glyphMapName.length == 3) {
      lowerGlyphMapName =
      '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1]
          .toString()
          .toLowerCase()}_${glyphMapName[2].toString().toLowerCase()}';
    } else if (glyphMapName.length == 2) {
      lowerGlyphMapName =
      '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1]
          .toString()
          .toLowerCase()}';
    } else {
      lowerGlyphMapName = '${glyphMapName[0].toString().toLowerCase()}';
    }

    // Get codepoint
    int codePoint = 0;
    if (FlutterIcons.iconGlyphs.containsKey(lowerGlyphMapName)) {
      if (FlutterIcons.iconGlyphs[lowerGlyphMapName].containsKey(iconName)) {
        codePoint = FlutterIcons.iconGlyphs[lowerGlyphMapName][iconName];
      }
    }

    switch (iconFamily) {
      case 'AntDesign':
        return FlutterIconData.antDesign(codePoint);
      case 'Entypo':
        return FlutterIconData.entypo(codePoint);
      case 'EvilIcons':
        return FlutterIconData.evilIcons(codePoint);
      case 'Feather':
        return FlutterIconData.feather(codePoint);
      case 'FontAwesome':
        return FlutterIconData.fontAwesome(codePoint);
      case 'Fontisto':
        return FlutterIconData.fontisto(codePoint);
      case 'Foundation':
        return FlutterIconData.foundation(codePoint);
      case 'Ionicons':
        return FlutterIconData.ionicons(codePoint);
      case 'MaterialCommunityIcons':
        return FlutterIconData.materialCommunityIcons(codePoint);
      case 'MaterialIcons':
        return FlutterIconData.materialIcons(codePoint);
      case 'Octicons':
        return FlutterIconData.octicons(codePoint);
      case 'SimpleLineIcons':
        return FlutterIconData.simpleLineIcons(codePoint);
      case 'WeatherIcons':
        return FlutterIconData.weatherIcons(codePoint);
      case 'Zocial':
        return FlutterIconData.zocial(codePoint);
    }
  }

  /// Takes the values [iconFamily] and [iconName] and returns bool if exists.
  static hasIconData(iconFamily, iconName) {
    final glyphMapName = iconFamily.split(new RegExp(r"(?<=[a-z])(?=[A-Z])"));
    var lowerGlyphMapName = '';
    if (glyphMapName.length == 3) {
      lowerGlyphMapName =
      '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1]
          .toString()
          .toLowerCase()}_${glyphMapName[2].toString().toLowerCase()}';
    } else if (glyphMapName.length == 2) {
      lowerGlyphMapName =
      '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1]
          .toString()
          .toLowerCase()}';
    } else {
      lowerGlyphMapName = '${glyphMapName[0].toString().toLowerCase()}';
    }

    if (FlutterIcons.iconGlyphs.containsKey(lowerGlyphMapName)) {
      if (FlutterIcons.iconGlyphs[lowerGlyphMapName].containsKey(iconName)) {
        return true;
      }
    }

    return false;
  }
}