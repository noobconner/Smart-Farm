import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //expliclt
  final formkey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  //method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'name: ',
          helperText: 'Type Display Name',
          icon: Icon(
            Icons.perm_identity,
            size: 50.0,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Pleses Fill Name In Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'email: ',
          helperText: 'Type you@email.com',
          icon: Icon(
            Icons.account_circle,
            size: 50.0,
          )),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Type Email Formet';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'password: ',
          helperText: 'Type your password',
          icon: Icon(
            Icons.lock,
            size: 50.0,
          )),
      validator: (String value) {
        if (value.length <= 6) {
          return 'Pass Much More 6 Charator';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.send),
      onPressed: () {
        print('upload');
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          print('Name = $nameString,Email = $emailString,Password = $passwordString');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(
        key: formkey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/weed.png'), fit: BoxFit.cover)),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 60.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.5)),
            width: 250.0,
            height: 300.0,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
