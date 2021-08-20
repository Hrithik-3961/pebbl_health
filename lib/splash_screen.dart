import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/choose_location.dart';
import 'package:pebbl_health/home.dart';
import 'package:pebbl_health/start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async {
    Future.delayed(Duration(seconds: 1, milliseconds: 500)).then((value) {
      Navigator.of(context).pushReplacement(PageTransition(
          child: Home(), type: PageTransitionType.rightToLeft));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/leaves.png"),
            Image.asset("assets/images/logo.png")
          ],
        ),
      ),
    );
  }
}
