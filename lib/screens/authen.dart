import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:ung_ssru/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double mySize = 100.0;
  Widget mySingBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  Widget singUpButton() {
    return RaisedButton(
      color: Colors.orange,
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
      onPressed: () {},
    );
  }

  Widget myButton() {
    return Container(
      width: 200.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: singInButton(),
          ),
          mySingBox(),
          Expanded(
            child: singUpButton(),
          )
        ],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 220.0,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'password : ', hintText: 'more 6 carractor'),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 220.0,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(labelText: 'email :', hintText: 'you@email.com'),
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

  Widget showText() {
    return Text(
      'porn hub',
      style: TextStyle(fontSize: 40.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orange[500],
          Colors.black,
        ], begin: Alignment.topLeft)),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText(),
            myButton()
          ],
        ),
      ),
    );
  }
}
