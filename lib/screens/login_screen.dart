import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
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
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.enhanced_encryption,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
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
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Expanded(
                  child: Material(
                    color: kBlueColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/chat_screen');
                      },
                      child: Text('Sign In'),
                      height: 42.0,
                      minWidth: 200.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
