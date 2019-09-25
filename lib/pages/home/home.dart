import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:elisen_mobile/pages/home/home_agent.dart';
import 'package:elisen_mobile/pages/home/map_fragment.dart';
import 'package:elisen_mobile/pages/home/setting_fragment.dart';
import 'package:elisen_mobile/pages/home/tasks_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _controller = PageController(
    keepPage: false,
  );


  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.page.toInt();
      });
    });
  }


  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays ([]);
    final GlobalKey _backdropKey = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.yellow[700],

      body: PageView(
        controller: _controller,
        //physics: BouncingScrollPhysics(),
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeAgentFragment(),
          TasksFragment(),
          MapFragment(),
          SettingFragment(),
        ],
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          //_controller.animateTo(index.toDouble(), duration: Duration(milliseconds: 300), curve: Curves.ease);
          _controller.animateToPage(index, duration: Duration(milliseconds: 50), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.yellow[800],
          ),

          BottomNavyBarItem(
              icon: Icon(Icons.category),
              title: Text('Tasks'),
              activeColor: Colors.red
          ),

          BottomNavyBarItem(
              icon: Icon(Icons.map),
              title: Text('Maps'),
              activeColor: Colors.red
          ),

          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue
          ),
        ],
      ),
    );
  }
}
