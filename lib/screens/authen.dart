import 'package:flutter/material.dart';
import 'package:ung_ssru/screens/menu.dart';

import 'package:ung_ssru/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  double mySize = 100.0;
  final formKey = GlobalKey<FormState>();
  String emailString = '', passwordString = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // Method

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      moveToService();
    }
  }

  void moveToService() {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

  Widget mySingBox() {
    return SizedBox(
      width: 10.0,
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.green[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Sign up',
        style: TextStyle(color: Colors.black87),
      ),
      onPressed: () {
        print('you sign up');
        //create route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget singInButton() {
    return RaisedButton(
        color: Colors.teal,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          formKey.currentState.save();

          checkAuthan();
        });
  }

  Future<void> checkAuthan() async {
    print('email = $emailString, password = $passwordString');
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Authan Success');
      moveToService();
    }).catchError((response) {
      String errorString = response.message;
      print('error = $errorString');
      myShowSnackBar(errorString);
    });
  }

  Widget myButtonup() {
    return Container(
      padding: EdgeInsets.all(5),
      width: 300.0,
      height: 60.0,
      child: signUpButton(),
    );
  }

  Widget myButton() {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 12),
      width: 300.0,
      height: 60.0,
      child: singInButton(),
    );
  }

  Widget passwordText() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: 300.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password :',
            hintText: 'More 6 Charactor',
            prefixIcon: Icon(Icons.lock_outline),
            labelStyle: TextStyle(fontSize: 15)),
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget emailText() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: 300.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email :',
            hintText: 'you@email.com',
            prefixIcon: Icon(Icons.person_outline),
            labelStyle: TextStyle(fontSize: 15)),
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 250.0,
      height: 250.0,
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget fopass() {
    return Padding(
        padding: EdgeInsets.only(top: 12),
        child: Center(
            child: Text(
          'Forgot your password?',
          style: TextStyle(
              fontFamily: 'SFUIDisplay',
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )));
  }

  void myShowSnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
      backgroundColor: Colors.red[300],
      duration: Duration(seconds: 8),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.green[300],
        onPressed: () {},
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Smart Farm',
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
          color: Colors.green[100],
          child: Center(
              child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                showLogo(),
                emailText(),
                passwordText(),
                myButton(),
                myButtonup(),
                fopass()
                //singInButton()
              ],
            ),
          ))),
    );
  }
}
