import 'package:flutter/material.dart';
import 'package:gjuchat/welcome.dart';
import 'package:gjuchat/courses.dart';
import 'package:gjuchat/login.dart';
import 'package:gjuchat/chat.dart';
import 'package:gjuchat/course.dart';
import 'package:gjuchat/profile.dart';
import 'package:gjuchat/thankyou.dart';

void main() => runApp(GJUChat());

//TODO: Add routes
class GJUChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        Login.id: (context) => Login(),
        Courses.id: (context) => Courses(),
        Chat.id: (context) => Chat(),
        Profile.id: (context) => Profile(),
        Course.id: (context) => Course(),
        ThankYou.id: (context) => ThankYou(),
      },
    );
  }
}
