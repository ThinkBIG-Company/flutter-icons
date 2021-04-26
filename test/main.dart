import 'dart:io';

import 'fontAwesome5.dart';
import 'fontAwesome5_meta.dart';
import 'iconGlyphs.dart';

const reservedWords = [
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
  'return',
  'super',
  'switch',
  'this',
  'throw',
  'true',
  'try',
  'var',
  'void',
  'while',
  'with'
];

main() async {
  var rootDirectory = Directory.current.path;

  // First generate dart icon classes
  Map<String, dynamic> _iconGlyphs = iconGlyphs;
  List<String> keys = _iconGlyphs.keys.toList();

  for (int i = 0; i < keys.length; i++) {
    File file = File('$rootDirectory/lib/src/${keys[i]}.dart');
    if (!file.existsSync()) {
      file.createSync();
    }
    String allStr = """
   import 'package:flutter/material.dart';
   import 'flutter_icon_data.dart';""";
    allStr += 'class ${toCamelName(keys[i])} { ${toCamelName(keys[i])}._(); \n';
    Map<String, int> obj = _iconGlyphs[keys[i]];
    List<String> keys1 = obj.keys.toList();
    for (int j = 0; j < keys1.length; j++) {
      // fix
      final name = keys1[j].replaceAll('-', '_');
      if (reservedWords.contains(name)) {
        allStr +=
            'static const IconData \$$name = const FlutterIconData.${toName(keys[i])}(${obj[keys1[j]]});\n';
      } else {
        // Check if first char is number
        if (name.substring(0, 1).contains(new RegExp(r'[0-9]'))) {
          allStr +=
              'static const IconData \$$name = const FlutterIconData.${toName(keys[i])}(${obj[keys1[j]]});\n';
        } else {
          allStr +=
              'static const IconData $name = const FlutterIconData.${toName(keys[i])}(${obj[keys1[j]]});\n';
        }
      }
    }
    allStr += "}";
    file.writeAsStringSync(allStr);
  }

  // Next generate FontAwesome dart classes
  Map<String, dynamic> _fontAwesome5Glyphs = fontAwesome5_meta;
  List<String> _fontAwesome5GlyphsKeys = _fontAwesome5Glyphs.keys.toList();
  for (int i = 0; i < _fontAwesome5GlyphsKeys.length; i++) {
    File file = File(
        '$rootDirectory/lib/src/font_awesome_5_${_fontAwesome5GlyphsKeys[i]}.dart');
    if (!file.existsSync()) {
      file.createSync();
    }
    String allStr = """
    import 'package:flutter/material.dart';
    import 'flutter_icon_data.dart';""";
    allStr +=
        'class ${toCamelName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')} { ${toCamelName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')}._(); \n';
    List<String> obj = _fontAwesome5Glyphs[_fontAwesome5GlyphsKeys[i]];
    for (int j = 0; j < obj.length; j++) {
      // fix
      final name = obj[j].replaceAll('-', '_');
      if (reservedWords.contains(name)) {
        allStr +=
            'static const IconData \$$name = const FlutterIconData.${toName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')}(${fontAwesome5[obj[j]]});\n';
      } else {
        // Check if first char is number
        if (name.substring(0, 1).contains(new RegExp(r'[0-9]'))) {
          allStr +=
              'static const IconData \$$name = const FlutterIconData.${toName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')}(${fontAwesome5[obj[j]]});\n';
        } else {
          allStr +=
              'static const IconData $name = const FlutterIconData.${toName('font_awesome_5_${_fontAwesome5GlyphsKeys[i]}')}(${fontAwesome5[obj[j]]});\n';
        }
      }
    }
    allStr += "}";
    file.writeAsStringSync(allStr);
  }
  File f5Regularfile =
      File('$rootDirectory/lib/src/font_awesome_5_regular.dart');
  File f5file = File('$rootDirectory/lib/src/font_awesome_5.dart');
  if (!f5file.existsSync()) {
    f5Regularfile.copySync('$rootDirectory/lib/src/font_awesome_5.dart');

    RandomAccessFile raf = f5file.openSync(mode: FileMode.writeOnlyAppend);
    var f1 = await raf.setPosition(87);
    // Don't delete the whitespace after FontAwesome5 it will generate errors
    await f1.writeString('FontAwesome5      ');
    await f1.close();
  }

  // Lastly generate FlutterIcons file
  Directory flutterIconsDirectory = Directory('$rootDirectory/lib/src');
  File flutterIconFile = File('$rootDirectory/lib/src/flutter_icons.dart');
  List<File> files =
      flutterIconsDirectory.listSync().map((e) => File(e.path)).toList();
  String str = '''
import 'package:flutter/material.dart';
import 'flutter_icon_data.dart';
class FlutterIcons {
  FlutterIcons._();
  ''';
  for (var i = 0; i < files.length; i++) {
    final File file = files[i];
    if (file.path.indexOf('flutter_icon') == -1 &&
        file.path.indexOf('icon_toggle') == -1 &&
        file.path.indexOf('font_awesome_5') == -1) {
      final List<String> lines = file.readAsLinesSync();

      for (var k = 0; k < lines.length; k++) {
        final String line = lines[k];

        if (line.contains('static const')) {
          print(file.path);
          var suffix = getSimple(line);
          List lineList = line.split(' ');
          lineList[3] = lineList[3] + '_$suffix';
          String temp = lineList.join(' ');
          str += '\n';
          str += temp;
          print(str);
        }
      }
    }
  }
  str += '}';
  flutterIconFile.writeAsStringSync(str);
}

String toCamelName(String name) => name
    .split('_')
    .map((e) => '${e.substring(0, 1).toUpperCase()}${e.substring(1)}')
    .toList()
    .join('');

String toName(String name) {
  String _name = toCamelName(name);
  return '${_name.substring(0, 1).toLowerCase()}${_name.substring(1)}';
}

String getSimple(String line) {
  var name1 = line.split('.')[1];
  var name = name1.split('(')[0];

  //print(line);
  //print(name);

  if (name == 'fontAwesome') {
    return 'faw';
  }
  if (name == 'fontAwesome5') {
    return 'faw5';
  }
  if (name == 'fontAwesome5Brands') {
    return 'faw5b';
  }
  if (name == 'fontAwesome5Solid') {
    return 'faw5s';
  }
  if (name == 'fontisto') {
    return 'fto';
  }
  if (name == 'materialCommunityIcons') {
    return 'mco';
  }
  if (name == 'materialIcons') {
    return 'mdi';
  }
  if (name == 'simpleLineIcons') {
    return 'sli';
  }

  return name.substring(0, 3).toLowerCase();
}

enum IconLib {
  ///All Icons
  all,

  ///Ant Design Icons
  ant,

  ///Entypo Icons
  ent,

  ///Evil Icons
  evi,

  ///Feather Icons
  fea,

  ///Font Awesome Icons
  faw,

  ///Fontisto Icons
  fto,

  ///Foundation Icons
  fou,

  ///Ionicons Icons
  ion,

  ///Material Community Icons
  mco,

  ///Material Icons
  mdi,

  ///Octicons Icons
  oct,

  ///Simple Line Icons
  sli,

  ///Weather Icons
  wea,

  ///Zocial Icons
  zoc,
}
