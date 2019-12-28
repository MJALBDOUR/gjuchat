import 'package:flutter/material.dart';
import 'package:gjuchat_app/colors.dart';

class StudentLoginScreen extends StatefulWidget {
  static const String id = 'student_login_screen';

  @override
  _StudentLoginScreenState createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(32.0),
            children: <Widget>[
              SizedBox(height: 80.0),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.account_circle,
                  size: 32.0,
                ),
              ),
              Text(
                'GJUChat_',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 24.0),
//                TODO: Implement animated text (GJUChat_)
              Container(
                //TODO: Make the image shake once in while
                height: 150.0,
                child: Image.asset(
                  'assets/images/logo.png',
                  semanticLabel: 'gjuchat logo',
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    textColor: Colors.grey[500],
                    onPressed: () {
//                    TODO: go back to welcome screen --> push named (welcome_screen) to navigator stack
                    },
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    elevation: 8.0,
                    color: kGJUChatOrange,
                    child: Text('Next'),
                    onPressed: () {
//                    TODO: go to main view of the user whether admin or student, but first display an animation after login
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
