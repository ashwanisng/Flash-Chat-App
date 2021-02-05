import 'package:flutter/material.dart';

const kBlueColor = Color(0xFF054BA6);
const kLightBlueColor = Color(0xFF0477BF);
const kPurpleColor = Color(0xFF5B61B9);
const kWhiteColor = Color(0xFFF7F7F8);

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

const kTextFeildDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kBlueColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kBlueColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  prefixIcon: Icon(
    Icons.email,
    color: Colors.grey,
  ),
);
