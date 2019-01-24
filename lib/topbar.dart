import 'package:flutter/material.dart';
import 'nav.dart';
import 'article.dart';
import 'video.dart';
import 'image.dart';
import 'sound.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final _headTabs = <Tab>[
    Tab(
      icon: Icon(Icons.assignment),
      text: "Article",
    ),
    Tab(
      icon: Icon(Icons.video_library),
      text: "Video",
    ),
    Tab(
      icon: Icon(Icons.image),
      text: "Image",
    ),
    Tab(
      icon: Icon(Icons.record_voice_over),
      text: "Sound",
    ),
  ];

  final _headTabsBody = <Widget>[
    ArticlePage,
    VideoPage,
    SoundPage,
    ImagePage,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _headTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: TextField(
            style: Theme.of(context).textTheme.body1,
            maxLines: 1,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          )),
          bottom: TabBar(tabs: _headTabs),
        ),
        body: TabBarView(children: _headTabsBody),
        drawer: Drawer(
          child: navDrawer,
        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: _incrementCounter,
//          tooltip: 'Increment',
//          child: Icon(Icons.add),
//        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
