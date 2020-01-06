import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class Chat extends StatefulWidget {
  static const String id = 'chat';
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if(user != null) {
        loggedInUser = user;
      }
    } catch(e) {
      print(e)
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: kGJUChatBlue,
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Course Name'), // TODO: send from previous page,
          actions: <Widget>[
            IconButton(
              color: kGJUChatBlue,
              icon: Icon(Icons.info),
              onPressed: (){
//                TODO: Go to course info
              },
            ),
            IconButton(
              color: kGJUChatBlue,
              icon: Icon(Icons.account_circle),
              onPressed: (){
//                TODO: Go to profile
              },
            ),
          ],
        ),
      body: Column(
        children: <Widget>[
          MessagesStream(),
          Container(
            color: Colors.grey,
            child: Row(
              children: <Widget>[
                Expanded(child: TextField()),
                FlatButton(
                  onPressed: (){
//                    TODO Send message if not empty...
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
