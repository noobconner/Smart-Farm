import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ung_ssru/models/plant_model.dart';
import 'package:ung_ssru/screens/circle.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  // EX
  bool isLoading = false;
  final databaseReference = FirebaseDatabase.instance.reference();
  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;
  double mySize = 200.0;
  double raduisSize = 140.0;

//Method
  @override
  void initState() {
    super.initState();

    databaseReference
        .child('testproject-ad418')
        .once()
        .then((DataSnapshot snapshot) {
      double temp = snapshot.value['Temperature']['Data'];
      double humidity = snapshot.value['Humidity']['Data'];

      isLoading = true;
      _HomePageInit(temp, humidity);
    });
  }

  _HomePageInit(double temp, double humid) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    tempAnimation =
        Tween<double>(begin: -50, end: temp).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    humidityAnimation =
        Tween<double>(begin: -50, end: humid).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: isLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomPaint(
                        foregroundPainter:
                            CircleProgress(tempAnimation.value, true),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Temperature'),
                                Text(
                                  '${tempAnimation.value.toInt()}',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '°C',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    'Loading',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )));
  }
}
