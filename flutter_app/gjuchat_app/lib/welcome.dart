import 'package:flutter/material.dart';
import 'package:gjuchat_app/colors.dart';
import 'package:gjuchat_app/login.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 96.0,
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'to',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'GJUChat!',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Container(
              height: 200.0,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 56.0),
            RaisedButton(
              padding: EdgeInsets.all(18.0),
              onPressed: () {
                Navigator.pop(context);
              },
              color: kGJUChatOrange,
              textColor: Colors.white,
              child: Text(
                'Let\'s Chat',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
