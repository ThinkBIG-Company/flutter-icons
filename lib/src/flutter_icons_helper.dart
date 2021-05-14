import 'package:flutter_icons/flutter_icons.dart';

import 'flutter_icon_data.dart';

class FlutterIconsHelper {
  static getIconData(iconFamily, iconName) {
    final glyphMapName = iconFamily.split(new RegExp(r"(?<=[a-z])(?=[A-Z])"));
    var lowerGlyphMapName = '';
    if (glyphMapName.length == 3) {
      lowerGlyphMapName =
          '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1].toString().toLowerCase()}_${glyphMapName[2].toString().toLowerCase()}';
    } else if (glyphMapName.length == 2) {
      lowerGlyphMapName =
          '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1].toString().toLowerCase()}';
    } else {
      lowerGlyphMapName = '${glyphMapName[0].toString().toLowerCase()}';
    }

    //Fix
    lowerGlyphMapName = lowerGlyphMapName.replaceAll('-', '_');

    print(lowerGlyphMapName);

    // Get codepoint
    int codePoint = 0;
    if (FlutterIcons.glyphMap.containsKey(lowerGlyphMapName)) {
      if (FlutterIcons.glyphMap[lowerGlyphMapName].containsKey(iconName)) {
        codePoint = FlutterIcons.glyphMap[lowerGlyphMapName][iconName];
      }
    }

    print('iconFamily -> ' + iconFamily);
    print('codePoint -> ' + codePoint.toString());

    switch (iconFamily) {
      case 'AntDesign':
        return FlutterIconData.antDesign(codePoint);
      case 'AntDesign-Filled':
        return FlutterIconData.antDesignFilled(codePoint);
      case 'AntDesign-Outlined':
        return FlutterIconData.antDesignOutlined(codePoint);
      case 'Brandico':
        return FlutterIconData.brandico(codePoint);
      case 'ElusiveIcons':
        return FlutterIconData.elusiveIcons(codePoint);
      case 'Entypo':
        return FlutterIconData.entypo(codePoint);
      case 'EvilIcons':
        return FlutterIconData.evilIcons(codePoint);
      case 'Feather':
        return FlutterIconData.feather(codePoint);
      case 'FontAwesome':
        return FlutterIconData.fontAwesome(codePoint);
      case 'FontAwesome5':
        return FlutterIconData.fontAwesome5(codePoint);
      case 'FontAwesome5_Brands':
        return FlutterIconData.fontAwesome5Brands(codePoint);
      case 'FontAwesome5_Regular':
        return FlutterIconData.fontAwesome5Brands(codePoint);
      case 'FontAwesome5_Solid':
        return FlutterIconData.fontAwesome5Solid(codePoint);
      case 'Fontelico':
        return FlutterIconData.fontelico(codePoint);
      case 'Fontisto':
        return FlutterIconData.fontisto(codePoint);
      case 'Foundation':
        return FlutterIconData.foundation(codePoint);
      case 'Iconic':
        return FlutterIconData.iconic(codePoint);
      case 'Ionicons':
        return FlutterIconData.ionicons(codePoint);
      case 'Linearicons':
        return FlutterIconData.linearicons(codePoint);
      case 'Linecons':
        return FlutterIconData.linecons(codePoint);
      case 'Maki':
        return FlutterIconData.maki(codePoint);
      case 'MaterialCommunityIcons':
        return FlutterIconData.materialCommunityIcons(codePoint);
      case 'MaterialIcons-Baseline':
        return FlutterIconData.materialIconsBaseline(codePoint);
      case 'MaterialIcons-Outline':
        return FlutterIconData.materialIconsOutline(codePoint);
      case 'MaterialIcons-Round':
        return FlutterIconData.materialIconsRound(codePoint);
      case 'MaterialIcons-Sharp':
        return FlutterIconData.materialIconsSharp(codePoint);
      /*case 'MaterialIcons-TwoTone':
        return FlutterIconData.materialIconsTwoTone(codePoint);*/
      case 'MfgLabs':
        return FlutterIconData.mfgLabs(codePoint);
      case 'ModernPictograms':
        return FlutterIconData.modernPictograms(codePoint);
      case 'Octicons':
        return FlutterIconData.octicons(codePoint);
      case 'RpgAwesome':
        return FlutterIconData.rpgAwesome(codePoint);
      case 'SimpleLineIcons':
        return FlutterIconData.simpleLineIcons(codePoint);
      case 'Typicons':
        return FlutterIconData.typicons(codePoint);
      case 'WeatherIcons':
        return FlutterIconData.weatherIcons(codePoint);
      case 'WebSymbols':
        return FlutterIconData.webSymbols(codePoint);
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
          '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1].toString().toLowerCase()}_${glyphMapName[2].toString().toLowerCase()}';
    } else if (glyphMapName.length == 2) {
      lowerGlyphMapName =
          '${glyphMapName[0].toString().toLowerCase()}_${glyphMapName[1].toString().toLowerCase()}';
    } else {
      lowerGlyphMapName = '${glyphMapName[0].toString().toLowerCase()}';
    }

    //Fix
    lowerGlyphMapName = lowerGlyphMapName.replaceAll('-', '_');

    if (FlutterIcons.glyphMap.containsKey(lowerGlyphMapName)) {
      if (FlutterIcons.glyphMap[lowerGlyphMapName].containsKey(iconName)) {
        return true;
      }
    }

    return false;
  }
}
