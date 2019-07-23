import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ung_ssru/screens/my_map.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Ex
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameString = '';

//Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameString = firebaseUser.displayName;
    });
    print('Name = $nameString');
  }

  Widget shoowDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[headMenu(), signOutAnExit()],
      ),
    );
  }

  Widget signOutAnExit() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        size: 36.0,
        color: Colors.green[500],
      ),
      title: Text(
        'Sign Out & Exit',
        style: TextStyle(fontSize: 18.0),
      ),onTap: (){
        mySignOut();

      },
    );
  }

  Future<void>mySignOut()async{
    await firebaseAuth.signOut().then((response){
      exit(0);
    });

  }

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.green, Colors.yellow],
          radius: 1.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            child: Image.asset('images/logo.png'),
          ),
          Text(
            'Auto pot',
            style: TextStyle(color: Colors.green[200], fontSize: 24.0),
          ),
          Text('Login by $nameString')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: MyMap(),
      drawer: shoowDrawerMenu(),
    );
  }
}
