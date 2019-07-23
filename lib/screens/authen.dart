import 'package:flutter/material.dart';
import 'package:ung_ssru/screens/my_service.dart';
import 'package:ung_ssru/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      width: 8.0,
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.yellow[200],
      child: Text(
        'Sign up',
        style: TextStyle(color: Colors.black),
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
        color: Colors.black,
        child: Text(
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          formKey.currentState.save();
          moveToService();
          // checkAuthan();
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

  Widget myButton() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 12),
      width: 200.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: singInButton(),
          ),
          mySingBox(),
          Expanded(
            child: signUpButton(),
          )
        ],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
        ),
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: mySize,
      height: mySize,
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.contain,
      ),
    );
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
          'Auto Pot',
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.green[100],
        child: Center(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: [Colors.yellow[100], Colors.green[200]])),
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(24),
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
                    ],
                  ),
                ))),
      ),
    );
  }
}
