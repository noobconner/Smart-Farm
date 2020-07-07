import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_ssru/screens/authen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String displayNameStrin = '';
  // Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      displayNameStrin = firebaseUser.displayName;
    });
    print('Name = $displayNameStrin');
  }

  Widget mySignOut() {
    return Container(
      width: 150.0,
      height: 50.0,
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
          color: Colors.red[300],
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            'Log Out',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {
            processSignOut();
          }),
    );
  }

  Widget showBottonTitle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
      child: Text(
        'Siripon',
        style: TextStyle(fontSize: 25.0, color: Colors.white),
      ),
    );
  }

  Widget proFileImage() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // background image and bottom contents
        Column(
          children: <Widget>[
            Container(
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/farm2.jpg"),
                    fit: BoxFit.cover,
                  ),boxShadow: [new BoxShadow(color: Colors.black, blurRadius: 8.0)],
                )),
          ],
        ),
        // Profile image
        Positioned(
          top: 150.0, // (background container size) - (circle height / 2)
          child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: new AssetImage("images/weed.png"),
                      fit: BoxFit.cover))),
        ),
        Positioned(
          top: 320.0,
          child: showBottonTitle(),
        )
      ],
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      var homeRoute =
          MaterialPageRoute(builder: (BuildContext context) => Authen());
      Navigator.of(context)
          .pushAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: proFileImage());
  }
}
