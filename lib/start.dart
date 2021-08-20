import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/login.dart';
import 'package:pebbl_health/shared/shared.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        getPage(
            imageName: "welcome_image",
            text1: "Welcome to ",
            text2: "Pebbl",
            text3: "Your Healthcare Companion"),
        getPage(
          imageName: "vitals_image",
          text1: "Record your vitals",
          text2: "",
          text3:
              "Use the device to measure your Heart Rate, SpO2, Body Temperature and Lung Health",
        ),
        getPage(
          imageName: "teleconsult_image",
          text1: "Teleconsult your Doctor",
          text2: "",
          text3:
              "Chat or video call your doctor, get timely reminders to take prescribed medicines",
        ),
        getPage(
          imageName: "records_image",
          text1: "Store Health Records",
          text2: "",
          text3: "Past Health records, Diagnostic reports, Vital records",
        ),
        getPage(
          imageName: "order_image",
          text1: "Order Tests and Medicines",
          text2: "",
          text3:
              "Get online delivery of medicines, Book tests at diagnostic centres",
        ),
      ],
      showSkipButton: true,
      showNextButton: false,
      done: Text("Done"),
      skip: Text("Skip"),
      skipColor: secondaryColor,
      doneColor: secondaryColor,
      dotsDecorator: DotsDecorator(
          size: Size(5, 5),
          activeSize: Size(7, 7),
          color: Colors.grey[300]!,
          activeColor: primaryColor),
      onDone: () {
        Navigator.of(context).pushAndRemoveUntil(PageTransition(
            child: Login(),
            type: PageTransitionType
                .rightToLeft),
                (route) => false);
      },
      onSkip: () {
        Navigator.of(context).pushAndRemoveUntil(PageTransition(
            child: Login(),
            type: PageTransitionType
                .rightToLeft),
                (route) => false);
      },
    );
  }

  PageViewModel getPage(
      {required String imageName,
      required String text1,
      required String text2,
      required String text3}) {
    return PageViewModel(
      title: "",
      decoration: PageDecoration(fullScreen: true),
      body: "",
      useScrollView: false,
      image: Stack(
        children: [
          Center(child: SvgPicture.asset("assets/images/background.svg")),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              SvgPicture.asset(
                "assets/images/$imageName.svg",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              RichText(
                  text: TextSpan(
                      text: text1,
                      style: textStyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.072,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: text2, style: TextStyle(color: primaryColor))
                      ])),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  text3,
                  style: textStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.04),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
