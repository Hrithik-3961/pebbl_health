import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/home.dart';
import 'package:pebbl_health/shared/shared.dart';

class Completion extends StatefulWidget {
  const Completion({Key? key}) : super(key: key);

  @override
  _CompletionState createState() => _CompletionState();
}

class _CompletionState extends State<Completion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Pebbl ",
                      style: textStyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                      children: [
                        TextSpan(
                            text: "is ready to use",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.black))
                      ]),
                ),
                Text("Now you can start using the device"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.055,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            child: Home(),
                            type: PageTransitionType.rightToLeft),
                        (route) => false);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.02)),
                  color: primaryColorTint,
                  child: Text(
                    "Start",
                    style: textStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
