import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';
import 'package:gjuchat/thankyou.dart';

class Profile extends StatefulWidget {
  static const String id = 'profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kGJUChatBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Profile', style: TextStyle(color: Colors.black54)),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(children: <Widget>[
              Text(
                'Student name',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'Student major',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'Student email',
                style: TextStyle(fontSize: 20.0),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                child: Text('Log Out', style: TextStyle(color: Colors.white)),
                color: kGJUChatBlue,
                onPressed: () {
                  _auth.signOut();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushNamed(context, ThankYou.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
