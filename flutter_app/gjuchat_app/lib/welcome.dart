import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 96.0,
            ),
            Container(
              height: 150.0,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 96.0),
            Container(
              height: 40.0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Let\'s Chat!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
