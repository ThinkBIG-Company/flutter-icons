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
        primarySwatch: Colors.blue,
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
        title: Text(widget.title),
      ),
      body: buildList(),
    );
  }

  buildList() {

    print(AntDesign.dev());

    Map<String, dynamic> map = {
      //'AntDesign': AntDesign.dev(),
      'Entypo': iconGlyphs['entypo'],
      'EvilIcons': iconGlyphs['evil_icons'],
      'Feather': iconGlyphs['feather'],
      'FontAwesome': iconGlyphs['font_awesome'],
      'Fontisto': iconGlyphs['fontisto'],
      'Foundation': iconGlyphs['foundation'],
      'Ionicons': iconGlyphs['ionicons'],
      'MaterialCommunityIcons': iconGlyphs['material_community_icons'],
      'MaterialIcons': iconGlyphs['material_icons'],
      'Octicons': iconGlyphs['octicons'],
      'SimpleLineIcons': iconGlyphs['simple_line_icons'],
      'WeatherIcons': iconGlyphs['weather_icons'],
      'Zocial': iconGlyphs['zocial'],
    };

    return ListView.builder(
      shrinkWrap: true,
      itemCount: map.keys.length,
      itemBuilder: (BuildContext context, int i) {
        return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('icon_page', arguments: {
                'glyphMaps': map[map.keys.elementAt(i)],
                'iconFamily': map.keys.elementAt(i)
              });
            },
            child: Container(
              height: 47,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(map.keys.elementAt(i)),
                    Spacer(),
                    Text(map[map.keys.elementAt(i)].length.toString()),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ));
      },
    );
  }
}
