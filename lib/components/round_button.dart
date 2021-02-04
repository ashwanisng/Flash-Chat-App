import 'dart:ui';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {@required this.buttonColor,
      @required this.buttonText,
      @required this.onpress});
  final String buttonText;
  final Color buttonColor;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          height: 42.0,
          minWidth: 200.0,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
