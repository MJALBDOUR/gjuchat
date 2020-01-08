import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';

class ThankYou extends StatefulWidget {
  static const String id = 'thankyou';
  @override
  _ThankYouState createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Thank you for using GJUChat',
                textAlign: TextAlign.center,
                style: TextStyle(color: kGJUChatOrange, fontSize: 32.0),
              ),
              Text(
                '^_^',
                textAlign: TextAlign.center,
                style: TextStyle(color: kGJUChatOrange, fontSize: 32.0),
              ),
              SizedBox(height: 100.0),
              Text('you may close this app now',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
