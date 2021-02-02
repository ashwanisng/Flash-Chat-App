import 'package:flutter/material.dart';

const kBlueColor = Color(0xFF054BA6);
const kLightBlueColor = Color(0xFF0477BF);

const kMessageTextFeildDecoration = InputDecoration(
  hintText: 'Type your message here...',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
);

const kMessageContainsDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(32.0),
  ),
);
