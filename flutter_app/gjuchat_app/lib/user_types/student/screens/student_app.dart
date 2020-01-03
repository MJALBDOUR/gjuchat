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
            ],
          ),
          body: ListView(padding: EdgeInsets.all(16.0), children: courses()),
        ),
      ),
    );
  }
}

// create a function that returns a ListTile --> each list tile is a course comming from firebase.

List<ListTile> courses() {
  List<ListTile> coursesList = [];
  ListTile course;
//  TODO: Get courses from db and store them
  // for() {
//    TODO: Get course from db
//  TODO: dont forget to add the onTap Callback to each ListTile where it takes the student to the chat screen
//  TODO: Append it to the coursesList
  //}
  return coursesList;
}
