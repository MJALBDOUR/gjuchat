import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';
import 'package:gjuchat/login.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Welcome to',
              textAlign: TextAlign.center,
            ),
            Text('GJUChat!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                )),
            SizedBox(
              height: 16.0,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 150.0,
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                  color: kGJUChatOrange,
                  child: Text('NEXT', style: TextStyle(color: Colors.white)),
                  onPressed: () {
//              TODO: Go to Login
                    Navigator.pushNamed(context, Login.id);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
