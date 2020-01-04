import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gjuchat/courses.dart';

// TODO: Add firebase auth

class Login extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
            child: Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'Please Log In',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Icon(Icons.account_circle),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'GJUChat_',
                    style: TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Email Address'),
                    textAlign: TextAlign.center,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: kGJUChatOrange,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Password'),
                    textAlign: TextAlign.center,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: kGJUChatOrange,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        color: Colors.grey,
                        child: Text('RESET',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
//                        TODO: Empty text fields
                          setState(() {
                            email = '';
                            password = '';
                          });
                        },
                        disabledColor: Colors.black,
                      ),
                      RaisedButton(
                        color: kGJUChatOrange,
                        child: Text('LOG IN',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
//                        TODO: Perform authentication
                          setState(() {
//                            TODO: SHOW SPINNER DURING AUTH
                          });

                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, Courses.id);
                            }

                            setState(() {
//                            TODO: HIDE SPINNER
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
