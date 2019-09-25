import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays ([]);

    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // Degrader top
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.yellow[700],
                            Colors.yellow[600],
                          ]
                      )
                  ),
                ),
              ),

              // Degrade bottom
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.yellow[800],
                            Colors.yellow[700],
                          ]
                      )
                  ),
                ),
              ),

              // Entete
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 44,
                      ),

                      Container(
                        width: 62,
                        height: 62,
                        child: Image.asset("assets/images/logo-mtn.jpg"),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        "ELISEN FOR MTN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 28),
                      ),
                    ],
                  ),

                  width: double.infinity,

                  height: 300,

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.yellow[800],
                            Colors.yellow[700],
                          ]
                      )
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value){},
                cursorColor: Colors.yellow[800],
                decoration: InputDecoration(
                    hintText: "Numero ou email",

                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.alternate_email,
                        color: Colors.yellow[800],
                      ),
                    ),

                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value){},
                cursorColor: Colors.yellow[800],
                decoration: InputDecoration(
                    hintText: "Mot de passe",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Colors.yellow[800],
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.yellow[700]),
                child: FlatButton(
                  child: Text(
                    "Connexion",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                ),
              )
          ),

          SizedBox(height: 20,),

          Center(
            child: Text("MOT DE PASSE OUBLIE ?", style: TextStyle(color:Colors.red,fontSize: 12 ,fontWeight: FontWeight.w700),),
          ),
        ],
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
