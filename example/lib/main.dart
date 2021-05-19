import 'package:example/IconsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Icons Explorer'),
      routes: {'icon_page': (_) => IconsPage()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalIcons = 0;
  Map<String, dynamic> iconsMap = {
    'AntDesign': {
      'version': '3.0.0',
      'glyphs': FlutterIcons.glyphMap['ant_design']
    },
    'AntDesign-Filled': {
      'version': '4.1.0',
      'glyphs': FlutterIcons.glyphMap['ant_design_filled']
    },
    'AntDesign-Outlined': {
      'version': '4.1.0',
      'glyphs': FlutterIcons.glyphMap['ant_design_outlined']
    },
    'Brandico': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['brandico']
    },
    'ElusiveIcons': {
      'version': '2.0.0',
      'glyphs': FlutterIcons.glyphMap['elusive_icons']
    },
    'Entypo': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['entypo']
    },
    'EvilIcons': {
      'version': '1.10.1',
      'glyphs': FlutterIcons.glyphMap['evil_icons']
    },
    'Feather': {
      'version': '4.28.0',
      'glyphs': FlutterIcons.glyphMap['feather']
    },
    'FontAwesome': {
      'version': '4.7.0',
      'glyphs': FlutterIcons.glyphMap['font_awesome']
    },
    'Fontelico': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['fontelico']
    },
    'Fontisto': {
      'version': '3.0.4',
      'glyphs': FlutterIcons.glyphMap['fontisto']
    },
    'Foundation': {
      'version': '3.0.0',
      'glyphs': FlutterIcons.glyphMap['foundation']
    },
    'Ionicons': {
      'version': '5.4.0',
      'glyphs': FlutterIcons.glyphMap['ionicons']
    },
    'Linearicons': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['linearicons']
    },
    'Linecons': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['linecons']
    },
    'Maki': {
      'version': '6.2.0',
      'glyphs': FlutterIcons.glyphMap['maki']
    },
    'MaterialCommunityIcons': {
      'version': '5.4.45',
      'glyphs': FlutterIcons.glyphMap['material_community_icons']
    },
    'MaterialIcons-Baseline': {
      'version': 'git 05/10/2021',
      'glyphs': FlutterIcons.glyphMap['material_icons_baseline']
    },
    'MaterialIcons-Outline': {
      'version': 'git 05/10/2021',
      'glyphs': FlutterIcons.glyphMap['material_icons_outline']
    },
    'MaterialIcons-Round': {
      'version': 'git 05/10/2021',
      'glyphs': FlutterIcons.glyphMap['material_icons_round']
    },
    'MaterialIcons-Sharp': {
      'version': 'git 05/10/2021',
      'glyphs': FlutterIcons.glyphMap['material_icons_sharp']
    },
    // Currently not supported sorry
    /*'MaterialIcons-TwoTone': {
        'version': 'git 05/10/2021',
        'glyphs': FlutterIcons.glyphMap['material_icons_twotone']
      },*/
    'Meteocons': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['meteocons']
    },
    'MfgLabs': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['mfg_labs']
    },
    'ModernPictograms': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['modern_pictograms']
    },
    'Octicons': {
      'version': '13.0.0',
      'glyphs': FlutterIcons.glyphMap['octicons']
    },
    'RpgAwesome': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['rpg_awesome']
    },
    'SimpleLineIcons': {
      'version': '2.4.1',
      'glyphs': FlutterIcons.glyphMap['simple_line_icons']
    },
    'Typicons': {
      'version': '2.0.9',
      'glyphs': FlutterIcons.glyphMap['typicons']
    },
    'WeatherIcons': {
      'version': '2.0.10',
      'glyphs': FlutterIcons.glyphMap['weather_icons']
    },
    'WebSymbols': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['web_symbols']
    },
    'Zocial': {
      'version': '1.0.0',
      'glyphs': FlutterIcons.glyphMap['zocial']
    }
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconsMap.forEach((k, v) {
      //print("Key : $k, Value : ${v['glyphs'].length}");
      totalIcons += v['glyphs'].length as int;
    });

    print(totalIcons);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Row(
            children: <Widget>[
              Text(
                widget.title,
              ),
              Spacer(),
              Text(
                totalIcons > 20000 ? 'over 20k+ icons' : '$totalIcons icons',
              )
            ],
          ),
        ),
        body: buildList());
  }

  buildList() {
    return ListView.builder(
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: iconsMap.keys.length,
      itemBuilder: (BuildContext context, int i) {
        return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('icon_page', arguments: {
                'glyphMaps': iconsMap[iconsMap.keys.elementAt(i)]['glyphs'],
                'iconFamily': iconsMap.keys.elementAt(i)
              });
            },
            child: Container(
              height: 47,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(iconsMap.keys.elementAt(i) +
                        (iconsMap[iconsMap.keys.elementAt(i)]['version']
                                .toString()
                                .contains('git')
                            ? ' '
                            : ' v') +
                        iconsMap[iconsMap.keys.elementAt(i)]['version']),
                    Spacer(),
                    Text(iconsMap[iconsMap.keys.elementAt(i)]['glyphs']
                        .length
                        .toString()),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ));
      },
    );
  }
}
