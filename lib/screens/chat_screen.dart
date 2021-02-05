import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String messageText;

  final messageController = TextEditingController();

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
              MessageStream(),
              Container(
                decoration: kMessageContainsDecoration,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
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

                        messageController.clear();
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

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            backgroundColor: kBlueColor,
          );
        }
        final messages = snapshot.data.docs;
        List<MessagesBubble> messageBubbles = [];
        for (var msg in messages) {
          final messageText = msg.data()['text'];
          final messageSender = msg.data()['sender'];
          final messageBubble = MessagesBubble(
            text: messageText,
            sender: messageSender,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessagesBubble extends StatelessWidget {
  MessagesBubble({this.sender, this.text});
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
