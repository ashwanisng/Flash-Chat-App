import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //*  its also correct
  //   final messages = await _firestore.collection('messages').get();

  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  void messagesStream() async {
    await for (var snap in _firestore.collection('messages').snapshots()) {
      for (var message in snap.docs) {
        print(message.data());
      }
    }
  }

  // void getMessageStream() {
  //* its also correct
  //   _firestore.collection('messages').get().then(
  //         (value) => value.docs.forEach(
  //           (element) {
  //             print(element.data());
  //           },
  //         ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        leading: null,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // _auth.signOut();
              // Navigator.pop(context);
              // getMessageStream();
              // getMessages();
              messagesStream();
            },
          ),
        ],
        title: Text('Flash Chat⚡️'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: kBlueColor,
                    );
                  }
                  final messages = snapshot.data.docs;
                  List<Text> messageWidgets = [];
                  for (var msg in messages) {
                    final messageText = msg.data()['text'];
                    final messageSender = msg.data()['sender'];
                    final messageWidget = Text(
                      '$messageText from $messageSender',
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    );
                    messageWidgets.add(messageWidget);
                  }
                  return Expanded(
                    child: ListView(
                      children: messageWidgets,
                    ),
                  );
                },
              ),
              Container(
                decoration: kMessageContainsDecoration,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFeildDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        // messageText + loggedInUser.eamil

                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email
                        });
                      },
                      hoverColor: kLightBlueColor,
                      child: Icon(
                        Icons.send,
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
