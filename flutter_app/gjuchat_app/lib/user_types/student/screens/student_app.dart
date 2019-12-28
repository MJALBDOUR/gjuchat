import 'package:flutter/material.dart';
import 'package:gjuchat_app/colors.dart';

class StudentApp extends StatefulWidget {
  @override
  _StudentAppState createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
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
            title: Text(
              'Courses',
              style: TextStyle(color: kGJUChatBlue),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: kGJUChatBlue,
                ),
                onPressed: () {
//                TODO: Go to profile
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {
//                  TODO: show sign out warning
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}
