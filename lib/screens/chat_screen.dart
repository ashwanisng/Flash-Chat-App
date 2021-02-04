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
              _auth.signOut();
              Navigator.pop(context);
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
                    )
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
