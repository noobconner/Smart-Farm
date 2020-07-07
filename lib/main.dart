import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ung_ssru/screens/authen.dart';

main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.red,
        cursorColor: Colors.orange,
        backgroundColor: Colors.blueAccent[200]
      ),
      home: Authen(),
    );
  }
}
