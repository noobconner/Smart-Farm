import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Ex

//Method

  Widget shoowDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headMenu(),
        ],
      ),
    );
  }

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(),
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
          Text('Login by ...')
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
      body: Text('body'),
      drawer: shoowDrawerMenu(),
    );
  }
}
