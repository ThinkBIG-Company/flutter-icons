import 'dart:io';

import 'fontAwesome5.dart';
import 'fontAwesome5_meta.dart';
import 'iconGlyphs.dart';

const logToConsole = false;

const dartReservedWords = [
  'assert',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'default',
  'do',
  'else',
  'enum',
  'extends',
  'false',
  'final',
  'finally',
  'for',
  'if',
  'in',
  'is',
  'new',
  'null',
  'rethrow',
  'return',
  'static',
  'super',
  'switch',
  'this',
  'throw',
  'true',
  'try',
  'var',
  'void',
  'while',
  'with',
];

void main() async {
  var rootDirectory = Directory.current.path;

  // First generate dart icon classes
  Map<String, dynamic> _iconGlyphs = iconGlyphs;
  List<String> keys = _iconGlyphs.keys.toList();

  for (int i = 0; i < keys.length; i++) {
    File file = File('$rootDirectory/lib/src/${keys[i]}.dart');
    // FontAwesome will be generated within its own routine
    // So cancel generation of these files
    if (file.path.indexOf('font_awesome5') == -1 &&
        file.path.indexOf('font_awesome5_brands') == -1 &&
        file.path.indexOf('font_awesome5_regular') == -1 &&
        file.path.indexOf('font_awesome5_solid') == -1
        ) {
      if (!file.existsSync()) {
        file.createSync();
      }
      // Delete content
      file.writeAsStringSync('');

      String allStr = '''
import 'package:flutter/material.dart';
import 'flutter_icon_data.dart';
  ''';
      allStr += 'class ${toCamelName(keys[i])} { ${toCamelName(keys[i])}._(); \n';
      Map<String, int> obj = _iconGlyphs[keys[i]];
      List<String> keys1 = obj.keys.toList();
      for (int j = 0; j < keys1.length; j++) {
        // fix
        final name = keys1[j].replaceAll('-', '_');
        if (dartReservedWords.contains(name) || name.substring(0, 1).contains(new RegExp(r'[0-9]'))) {
          allStr += 'static const IconData \$$name = const FlutterIconData.${toName(keys[i])}(${obj[keys1[j]]});\n';
        } else {
          allStr += 'static const IconData $name = const FlutterIconData.${toName(keys[i])}(${obj[keys1[j]]});\n';
        }
      }
      allStr += '}';
      file.writeAsStringSync(allStr);
    }
  }

  // Next generate FontAwesome 5 dart classes
  Map<String, dynamic> _fontAwesome5Glyphs = fontAwesome5_meta;
  if (logToConsole) {
    print(_fontAwesome5Glyphs);
  }
  List<String> _fontAwesome5GlyphsKeys = _fontAwesome5Glyphs.keys.toList();
  for (int i = 0; i < _fontAwesome5GlyphsKeys.length; i++) {
    File file = File('$rootDirectory/lib/src/font_awesome_5_${_fontAwesome5GlyphsKeys[i]}.dart');
    if (!file.existsSync()) {
      file.createSync();
    }
    // Delete content
    file.writeAsStringSync('');

    String allStr = '''
import 'package:flutter/material.dart';
import 'flutter_icon_data.dart';
  ''';
    allStr += 'class ${toCamelName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')} { ${toCamelName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')}._(); \n';
    List<String> obj = _fontAwesome5Glyphs[_fontAwesome5GlyphsKeys[i]];
    for (int j = 0; j < obj.length; j++) {
      // fix
      final name = obj[j].replaceAll('-', '_');
      if (dartReservedWords.contains(name) || name.substring(0, 1).contains(new RegExp(r'[0-9]'))) {
        allStr += 'static const IconData \$$name = const FlutterIconData.${toName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')}(${fontAwesome5[obj[j]]});\n';
      } else {
        allStr += 'static const IconData $name = const FlutterIconData.${toName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')}(${fontAwesome5[obj[j]]});\n';
      }
    }
    allStr += '}';
    file.writeAsStringSync(allStr);
  }
  /*File f5Regularfile =
      File('$rootDirectory/lib/src/font_awesome_5_regular.dart');
  File f5file = File('$rootDirectory/lib/src/font_awesome_5.dart');
  if (!f5file.existsSync()) {
    f5Regularfile.copySync('$rootDirectory/lib/src/font_awesome_5.dart');

    RandomAccessFile raf = f5file.openSync(mode: FileMode.writeOnlyAppend);
    var f1 = await raf.setPosition(87);
    // Don't delete the whitespace after FontAwesome5 it will generate errors
    await f1.writeString('FontAwesome5      ');
    await f1.close();
  }*/

  //Lastly generate FlutterIcons file
  Directory flutterIconsDirectory = Directory('$rootDirectory/lib/src');
  File flutterIconFile = File('$rootDirectory/lib/src/flutter_icons.dart');
  List<File> files = flutterIconsDirectory.listSync().map((e) => File(e.path)).toList();
  String str = '''
import 'package:flutter/material.dart';
import 'flutter_icon_data.dart';
class FlutterIcons {
  FlutterIcons._();
  ''';
  for (var i = 0; i < files.length; i++) {
    final File file = files[i];
    if (file.path.indexOf('flutter_icon') == -1 && file.path.indexOf('icon_toggle') == -1 && file.path.indexOf('font_awesome_5') == -1 /*&&
        file.path.indexOf('ant_design') == -1 &&
        file.path.indexOf('entypo') == -1 &&
        file.path.indexOf('evil_icons') == -1 &&
        file.path.indexOf('feather') == -1 &&
        file.path.indexOf('fontisto') == -1 &&
        file.path.indexOf('foundation') == -1 &&
        file.path.indexOf('ionicons') == -1 &&
        file.path.indexOf('material_community_icons') == -1 &&
        file.path.indexOf('material_icons') == -1 &&
        file.path.indexOf('octicons') == -1 &&
        file.path.indexOf('simple_line_icons') == -1 &&
        file.path.indexOf('weather_icons') == -1 &&
        file.path.indexOf('zocial') == -1*/
        ) {
      final List<String> lines = file.readAsLinesSync();

      for (var k = 0; k < lines.length; k++) {
        final String line = lines[k];

        if (line.contains('static const')) {
          var suffix = getSimple(line);
          List lineList = line.split(' ');

          // Reverse some ugly things
          var correctedConst = lineList[3].replaceAll('\$', '');
          if (dartReservedWords.contains(correctedConst)) {
            lineList[3] = correctedConst + '_$suffix';
          } else {
            lineList[3] = lineList[3] + '_$suffix';
          }

          String temp = lineList.join(' ');
          str += '\n';
          str += temp;

          if (logToConsole) {
            print(str);
          }
        }
      }
    }
  }

  // Copy glyphs file
  String iconGlyphsContent = File('$rootDirectory/test/iconGlyphs.dart').readAsStringSync();
  iconGlyphsContent = iconGlyphsContent.replaceAll('iconGlyphs', 'glyphMap');
  str += 'static const $iconGlyphsContent';
  // Close class
  str += '}';

  flutterIconFile.writeAsStringSync(str);
}

String toCamelName(String name) => name.split('_').map((e) => '${e.substring(0, 1).toUpperCase()}${e.substring(1)}').toList().join('');

String toName(String name) {
  String _name = toCamelName(name);
  return '${_name.substring(0, 1).toLowerCase()}${_name.substring(1)}';
}

String getSimple(String line) {
  var name1 = line.split('.')[1];
  var name = name1.split('(')[0];

  //print(line);
  if (logToConsole) {
    print(name);
  }

  if (name == 'antDesign') {
    return 'ant';
  }
  if (name == 'antDesignFilled') {
    return 'adf';
  }
  if (name == 'antDesignOutlined') {
    return 'ado';
  }
  if (name == 'brandico') {
    return 'bdo';
  }
  if (name == 'elusiveIcons') {
    return 'elu';
  }
  if (name == 'entypo') {
    return 'ent';
  }
  if (name == 'evilIcons') {
    return 'evi';
  }
  if (name == 'feather') {
    return 'fea';
  }
  if (name == 'fontAwesome') {
    return 'fa';
  }
  if (name == 'fontAwesome5Regular') {
    return 'far';
  }
  if (name == 'fontAwesome5Brands') {
    return 'fab';
  }
  if (name == 'fontAwesome5Solid') {
    return 'fas';
  }
  if (name == 'fontelico') {
    return 'fon';
  }
  if (name == 'fontisto') {
    return 'fto';
  }
  if (name == 'foundation') {
    return 'fou';
  }
  if (name == 'ionicons') {
    return 'ion';
  }
  if (name == 'linearicons') {
    return 'lin';
  }
  if (name == 'linecons') {
    return 'lco';
  }
  if (name == 'maki') {
    return 'mak';
  }
  if (name == 'materialCommunityIcons') {
    return 'mco';
  }
  if (name == 'materialIconsBaseline') {
    return 'mib';
  }
  if (name == 'materialIconsOutline') {
    return 'mio';
  }
  if (name == 'materialIconsRound') {
    return 'mir';
  }
  if (name == 'materialIconsSharp') {
    return 'mis';
  }
  if (name == 'materialIconsTwotone') {
    return 'mit';
  }
  if (name == 'meteocons') {
    return 'met';
  }
  if (name == 'mfgLabsIconset') {
    return 'mfg';
  }
  if (name == 'octicons') {
    return 'oct';
  }
  if (name == 'simpleLineIcons') {
    return 'sli';
  }
  if (name == 'weatherIcons') {
    return 'wea';
  }
  if (name == 'zocial') {
    return 'zoc';
  }

  return name.substring(0, 3).toLowerCase();
}
