import 'package:flutter/material.dart';
import 'package:gjuchat_app/colors.dart';
//import 'package:gjuchat_app/welcome.dart';

class UserTypes extends StatefulWidget {
  @override
  _UserTypesState createState() => _UserTypesState();
}

class _UserTypesState extends State<UserTypes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      initialRoute: '/welcome',
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Login In As',
                  style: TextStyle(fontSize: 48.0),
                ),
                SizedBox(height: 32.0),
                Expanded(
                  child: Card(
                    color: kGJUChatOrange,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 100.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 24.0),
                        Text(
                          'Student',
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: kGJUChatBlue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.supervised_user_circle,
                          size: 100.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 24.0),
                        Text(
                          'Admin',
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
