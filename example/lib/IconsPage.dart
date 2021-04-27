import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' show FlutterIconsHelper;

class IconsPage extends StatefulWidget {
  @override
  _IconsPageState createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  bool isSearch = false;
  String keyword = '';
  List<String> _keys = [];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    Map<String, int> glyphMaps = args['glyphMaps'];
    String iconFamily = args['iconFamily'];
    if (glyphMaps.isNotEmpty && _keys.isEmpty && !isSearch) {
      _keys = glyphMaps.keys.toList();
    } else {
      if (!isSearch) {
        _keys = [];
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                keyword = value;
                if (keyword != '') {
                  var _kkeys = glyphMaps.keys.toList();
                  _kkeys.retainWhere((str) => str.contains(keyword));
                  setState(() {
                    isSearch = true;
                    _keys = _kkeys;
                  });
                }
              },
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter the icon name to search',
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                      _keys = [];
                      _searchController.clear();
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _keys.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          getIconData(iconFamily, _keys.elementAt(index)),
                          size: 32,
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
