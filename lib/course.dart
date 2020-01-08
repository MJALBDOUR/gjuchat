import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';

class Course extends StatefulWidget {
  static const String id = 'course';
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
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
        title: Text('Course Name', style: TextStyle(color: Colors.black54)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Course Name',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'Course ID',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'Course Major',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'Course Email',
              style: TextStyle(fontSize: 22.0),
            ),
          ],
        ),
      ),
    );
  }
}
