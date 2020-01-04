import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';
// TODO: Add firebase auth

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  Icon(Icons.account_circle),
                  SizedBox(
                    height: 32.0,
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
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Password'),
                    textAlign: TextAlign.center,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: kGJUChatOrange,
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
                        child:
                            Text('NEXT', style: TextStyle(color: Colors.white)),
                        onPressed: () {
//                        TODO: Perform authentication
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
