import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {},
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration:
                    kTextFeildDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {},
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFeildDecoration.copyWith(
                  hintText: 'Enter your password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                  prefixIcon: Icon(Icons.enhanced_encryption),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                buttonColor: kBlueColor,
                buttonText: 'Register',
                onpress: () {
                  Navigator.pushNamed(context, '/chat_screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
