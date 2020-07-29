
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listareas/Nueva.dart';
import 'package:listareas/login/Login.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();
    _mockCheckForSession().then(
            (status) {
          if (status) {
            _navigatorToHome();
          } else {
            _navigatorLogin();
          }
        }
    );
  }

 Future<bool> _mockCheckForSession() async{
   await Future.delayed(Duration(milliseconds: 5000),(){});

   return true;
 }
 void _navigatorToHome(){
   Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (BuildContext contex) => prueba()

    )
   );
 }

 void _navigatorLogin(){
   Navigator.of(context).pushReplacement(
       MaterialPageRoute(
           builder: (BuildContext contex) => Login()

       )
   );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
           Opacity(
             opacity:0.1,
               child: Container(
                 color: Color(0xFF5AC8FA),
               )//Image.asset('assets/img/logo3.jpg')
           ),
            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
                baseColor: Color(0xFF5AC8FA),
                highlightColor: Colors.yellow,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    'Task',
                  style: TextStyle(
                    fontSize: 90.0,
                    fontFamily: 'Pacifico',
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 18.0,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120.12)
                      )
                    ]

                  ),
                ),

              ),
            )
          ],
        ),
      ),

    );
  }
}

