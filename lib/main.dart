import 'dart:async';

import 'package:elisen_mobile/pages/home/home.dart';
import 'package:elisen_mobile/pages/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elisen Mobile Application',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(title: 'Elisen Mobile Application'),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/home': (BuildContext context) => new HomePage()
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() {
    var _duration = new Duration(seconds: 2);

    return Timer(_duration, () async {
      // Vérification du token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("TOKEN");

      if (token != null && token.isNotEmpty) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);

    return Scaffold(
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: const FractionalOffset(0.5, 0.0),
            end: const FractionalOffset(0.0, 0.5),
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.0,1.0],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.yellow[800],
              Colors.yellow[700],
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/images/logo-mtn.jpg"),
                    ),
                  ),

                  SizedBox(height: 15,),

                  Text('ELISEN FOR MTN', style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                  ),),
                ],
              ),
            ),

            Positioned(
              bottom: 20,
              left: 5,
              right: 5,
              child: Text('Copyrigth, MPS Holding', style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ), textAlign: TextAlign.center,),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
