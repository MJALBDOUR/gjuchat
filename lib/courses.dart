import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gjuchat/profile.dart';
import 'package:gjuchat/chat.dart';
//import 'package:gjuchat/course.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class Courses extends StatefulWidget {
  static const String id = 'courses';

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset('assets/images/logo.png'),
            ),
            title: Text('Courses', style: TextStyle(color: Colors.black54)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.account_circle),
                color: kGJUChatBlue,
                onPressed: () {
//                  TODO: Go to Profile
                  Navigator.pushNamed(context, Profile.id);
                },
              ),
            ],
          ),
          body: CoursesStream(),
        ),
      ),
    );
  }
}

class CoursesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('courses').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: kGJUChatOrange,
            ));
          default:
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                print(document.documentID);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Chat(courseID: document.documentID)));
                  },
                  title: Text(document['name']),
//                 TODO: Then fetch the last message/display it as a subtitle/or just display number of messages
                  subtitle: Text(
                    document.documentID.toString(),
                    style: TextStyle(color: kGJUChatOrange),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
