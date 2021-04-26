import 'package:example/iconGlyphs.dart';
import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  @override
  _IconsPageState createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  String keyword = "";
  List<String> _keys;

  getIconData(String iconSetName, String iconName) {
    switch (iconSetName) {
      case "AntDesign":
        return iconGlyphs[iconName];
      case "Entypo":
        return iconGlyphs[iconName];
      case "EvilIcons":
        return iconGlyphs[iconName];
      case "Feather":
        return iconGlyphs[iconName];
      case "FontAwesome":
        return iconGlyphs[iconName];
      case "Foundation":
        return iconGlyphs[iconName];
      case "Ionicons":
        return iconGlyphs[iconName];
      case "MaterialCommunityIcons":
        return iconGlyphs[iconName];
      case "MaterialIcons":
        return iconGlyphs[iconName];
      case "Octicons":
        return iconGlyphs[iconName];
      case "SimpleLineIcons":
        return iconGlyphs[iconName];
      case "Zocial":
        return iconGlyphs[iconName];
      case "WeatherIcons":
        return iconGlyphs[iconName];
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =  ModalRoute.of(context).settings.arguments as Map;
    Map<String, int> maps = args['glyphMaps'];
    String iconSetName = args['iconSetName'];
    _keys ??= maps.keys.toList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                keyword = value;
              },
              decoration: InputDecoration(
                hintText: "输入图标名称进行搜索",
                suffix: IconButton(
                  onPressed: () {
                    if (keyword != "") {
                      var _kkeys = maps.keys.toList();
                      _kkeys.retainWhere((str) => str.contains(keyword));
                      setState(() {
                        _keys = _kkeys;
                      });
                    }
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          getIconData(iconSetName, _keys.elementAt(index)),
                          size: 16,
                        ),
                        SizedBox(width: 10),
                        Text(_keys.elementAt(index))
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, index) => Container(
                  height: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
                itemCount: _keys.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
