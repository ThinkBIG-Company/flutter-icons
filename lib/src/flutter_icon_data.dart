import 'package:flutter/material.dart';

/// It is used to generate IconData under different icon sets
class FlutterIconData extends IconData {
  const FlutterIconData(int codePoint, String fontFamily) : super(codePoint, fontFamily: fontFamily, fontPackage: 'flutter_icons');

  const FlutterIconData.antDesign(int codePoint) : this(codePoint, 'AntDesign');

  const FlutterIconData.antDesignFilled(int codePoint) : this(codePoint, 'AntDesign-Filled');

  const FlutterIconData.antDesignOutlined(int codePoint) : this(codePoint, 'AntDesign-Outlined');

  const FlutterIconData.brandico(int codePoint) : this(codePoint, 'Brandico');

  const FlutterIconData.elusiveIcons(int codePoint) : this(codePoint, 'Elusive-Icons');

  const FlutterIconData.entypo(int codePoint) : this(codePoint, 'Entypo');

  const FlutterIconData.evilIcons(int codePoint) : this(codePoint, 'EvilIcons');

  const FlutterIconData.feather(int codePoint) : this(codePoint, 'Feather');

  const FlutterIconData.fontAwesome(int codePoint) : this(codePoint, 'FontAwesome');

  const FlutterIconData.fontAwesome5(int codePoint) : this(codePoint, 'FontAwesome5');

  const FlutterIconData.fontAwesome5Brands(int codePoint) : this(codePoint, 'FontAwesome5_Brands');

  const FlutterIconData.fontAwesome5Regular(int codePoint) : this(codePoint, 'FontAwesome5_Regular');

  const FlutterIconData.fontAwesome5Solid(int codePoint) : this(codePoint, 'FontAwesome5_Solid');

  const FlutterIconData.fontelico(int codePoint) : this(codePoint, 'Fontelico');

  const FlutterIconData.fontisto(int codePoint) : this(codePoint, 'Fontisto');

  const FlutterIconData.foundation(int codePoint) : this(codePoint, 'Foundation');

  const FlutterIconData.ionicons(int codePoint) : this(codePoint, 'Ionicons');

  const FlutterIconData.iconic(int codePoint) : this(codePoint, 'Iconic');

  const FlutterIconData.linearicons(int codePoint) : this(codePoint, 'Linearicons-Free');

  const FlutterIconData.linecons(int codePoint) : this(codePoint, 'Linecons');

  const FlutterIconData.maki(int codePoint) : this(codePoint, 'Maki');

  const FlutterIconData.materialCommunityIcons(int codePoint) : this(codePoint, 'MaterialCommunityIcons');

  const FlutterIconData.materialIconsBaseline(int codePoint) : this(codePoint, 'MaterialIcons-Baseline');

  const FlutterIconData.materialIconsOutline(int codePoint) : this(codePoint, 'MaterialIcons-Outline');

  const FlutterIconData.materialIconsRound(int codePoint) : this(codePoint, 'MaterialIcons-Round');

  const FlutterIconData.materialIconsSharp(int codePoint) : this(codePoint, 'MaterialIcons-Sharp');

  //const FlutterIconData.materialIconsTwoTone(int codePoint) : this(codePoint, 'MaterialIcons-TwoTone');

  const FlutterIconData.meteocons(int codePoint) : this(codePoint, 'Meteocons');

  const FlutterIconData.mfgLabs(int codePoint) : this(codePoint, 'MfgLabs');

  const FlutterIconData.modernPictograms(int codePoint) : this(codePoint, 'ModernPictograms');

  const FlutterIconData.octicons(int codePoint) : this(codePoint, 'Octicons');

  const FlutterIconData.rpgAwesome(int codePoint) : this(codePoint, 'RpgAwesome');

  const FlutterIconData.simpleLineIcons(int codePoint) : this(codePoint, 'SimpleLineIcons');

  const FlutterIconData.typicons(int codePoint) : this(codePoint, 'Typicons');

  const FlutterIconData.weatherIcons(int codePoint) : this(codePoint, 'WeatherIcons');

  const FlutterIconData.webSymbols(int codePoint) : this(codePoint, 'WebSymbols');

  const FlutterIconData.zocial(int codePoint) : this(codePoint, 'Zocial');
}
