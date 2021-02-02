import 'dart:ui';

import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        leading: null,
        actions: [
          Icon(
            Icons.logout,
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
                        onChanged: (value) {},
                        decoration: kMessageTextFeildDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
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
