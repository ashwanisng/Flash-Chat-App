import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  bool isVisible = true;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFeildDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFeildDecoration.copyWith(
                    hintText: 'Enter your password',
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                    prefixIcon: Icon(Icons.enhanced_encryption),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  buttonColor: kBlueColor,
                  buttonText: 'Register',
                  onpress: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);

                      if (newUser != null) {
                        Navigator.pushNamed(context, '/chat_screen');
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
