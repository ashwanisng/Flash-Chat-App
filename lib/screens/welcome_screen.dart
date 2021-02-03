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

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
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
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Flash Chat',
                      style: TextStyle(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: kLightBlueColor,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login_screen');
                    },
                    height: 42.0,
                    minWidth: 200.0,
                    child: Text("Log In"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: kBlueColor,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration_screen');
                    },
                    height: 42.0,
                    minWidth: 200.0,
                    child: Text("Register"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
