import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gjuchat/colors.dart';
import 'package:gjuchat/profile.dart';
import 'package:gjuchat/course.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class Chat extends StatefulWidget {
  final String courseID;
  static const String id = 'chat';

  Chat({this.courseID});

  @override
  _ChatState createState() => _ChatState(courseID: courseID);
}

class _ChatState extends State<Chat> {
  String courseID;
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String messageText;

  _ChatState({@required this.courseID});

  @override
  void initState() {
    super.initState();
    getCurrentUser();
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
//              TODO: Pop context from navigator stack
              Navigator.pop(context);
            },
            color: kGJUChatBlue,
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(courseID,
              style: TextStyle(
                  color: Colors.black54)), // TODO: send from previous page,
          actions: <Widget>[
            IconButton(
              color: kGJUChatBlue,
              icon: Icon(Icons.info),
              onPressed: () {
//                TODO: Go to course info
                Navigator.pushNamed(context, Course.id);
              },
            ),
            IconButton(
              color: kGJUChatBlue,
              icon: Icon(Icons.account_circle),
              onPressed: () {
//                TODO: Go to profile
                Navigator.pushNamed(context, Profile.id);
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(courseID: courseID),
            Container(
              padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              color: kGJUChatBlue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    onChanged: (value) {
                      messageText = value;
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: kGJUChatOrange,
                    decoration: InputDecoration(
                      hintText: 'Enter Message...',
                    ),
                  )),
                  FlatButton(
                    onPressed: () {
//                      TODO: Clear textfield using a messageTextController.clear()
                      messageTextController.clear();
                      if (messageText != '') {
//                    TODO Send message if not empty...
                        _firestore
                            .collection('courses')
                            .document(courseID)
                            .collection('messages')
                            .add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                          'date': DateTime.now(),
                        });
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: kGJUChatOrange,
                    ),
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

// ERROR is generated due to this class,"type 'Document reference' is not a subtype of type String
class MessagesStream extends StatelessWidget {
  final String courseID;
  MessagesStream({@required this.courseID});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('courses')
          .document(courseID)
          .collection('messages')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'].toString();
          final messageSender = message.data['sender'].toString();
          final date = message.data['date'].toString();

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            date: date,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.date, this.isMe});

  final String sender;
  final String text;
  final String date;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5.0,
            color: isMe ? kGJUChatOrange : kGJUChatBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          Text(
            date,
            textAlign: isMe ? TextAlign.end : TextAlign.start,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
