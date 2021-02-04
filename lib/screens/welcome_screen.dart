import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset(
                          'images/logo.png',
                          height: 60.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TypewriterAnimatedTextKit(
                      text: ['Flash Chat'],
                      speed: Duration(milliseconds: 300),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                buttonText: 'Log In',
                buttonColor: kLightBlueColor,
                onpress: () {
                  Navigator.pushNamed(context, '/login_screen');
                },
              ),
              RoundedButton(
                buttonColor: kBlueColor,
                buttonText: 'Register',
                onpress: () {
                  Navigator.pushNamed(context, '/registration_screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
