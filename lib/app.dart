import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';

class GJUChatApp extends StatefulWidget {
  @override
  _GJUChatAppState createState() => _GJUChatAppState();
}

class _GJUChatAppState extends State<GJUChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset('assets/images/logo.png'),
            ),
            title: Text('Courses', style: TextStyle(color: Colors.black54)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.account_circle),
                color: kGJUChatBlue,
                onPressed: () {
//                  TODO: Go to Profile
                },
              ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              ListTile(
                title: Text('Software Engineering'),
                subtitle: Text('hello!!!'),
                trailing: Icon(
                  Icons.arrow_right,
                  color: kGJUChatBlue,
                ),
                onTap: () {
//                  TODO: Go to course chat
                },
              ),
              ListTile(
                title: Text('Data Structures'),
                subtitle: Text('project #2'),
                trailing: Icon(
                  Icons.arrow_right,
                  color: kGJUChatBlue,
                ),
                onTap: () {
//                  TODO: Go to course chat
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
