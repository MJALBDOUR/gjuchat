import 'package:flutter/material.dart';
//import 'package:gjuchat_app/welcome.dart';
//import 'user_types/user_types.dart';
import 'package:gjuchat_app/user_types/student/screens/student_login.dart';

void main() => runApp(GjuChat());

class GjuChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StudentLoginScreen();
  }
}
