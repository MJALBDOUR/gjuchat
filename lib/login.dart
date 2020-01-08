import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gjuchat/courses.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool spinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Padding(
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
                    'GJUChat',
                    style: TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 100.0,
                      child: Image.asset('assets/images/logo.png'),
                    ),
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
                            spinner = true;
                          });

                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email.trim(), password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, Courses.id);
                            }
                            setState(() {
//                            TODO: HIDE SPINNER
                              spinner = false;
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
