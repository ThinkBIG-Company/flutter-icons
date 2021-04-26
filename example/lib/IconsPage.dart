import 'package:flutter/material.dart';
import 'package:flutter_icons/src/flutter_icons_helper.dart';

class IconsPage extends StatefulWidget {
  @override
  _IconsPageState createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  String keyword = "";
  List<String> _keys;

  @override
  Widget build(BuildContext context) {
    final args =  ModalRoute.of(context).settings.arguments as Map;
    Map<String, int> maps = args['glyphMaps'];
    print(maps);
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
                hintText: 'Enter the icon name to search',
                suffix: IconButton(
                  onPressed: () {
                    if (keyword != '') {
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
                  print(iconSetName);
                  print(_keys.elementAt(index));

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

  getIconData(String iconSetName, String iconName) {
    return FlutterIconsHelper.getIconData(iconSetName, iconName);
  }
}
