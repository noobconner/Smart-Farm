import 'dart:io';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ung_ssru/screens/camera.dart';
import 'package:ung_ssru/screens/plant_info.dart';
import 'package:ung_ssru/screens/profile.dart';

import 'home_page.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
// Ex

  double mySized = 25.0;
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    ShowProduct(),
    Camera(),
    Profile()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.grey[200],
        onTap: onTabTapped,
        index: _currentIndex,
        backgroundColor: Colors.blueAccent[100],
        items: <Widget>[
          Icon(
            CupertinoIcons.home,
            size: 30,
            color: Colors.red,
          ),
          Icon(
            CupertinoIcons.book_solid,
            size: 30,
            color: Colors.teal,
          ),
          Icon(CupertinoIcons.video_camera,
              size: 30, color: Colors.purple),
          Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.cyan),
        ],
      ),
    );
  }
}
