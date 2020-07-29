import 'package:flutter/material.dart';
import 'package:listareas/SplashScreen/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // brightness: Brightness.light
      ),
      home: Splash(),
    );
  }
}
