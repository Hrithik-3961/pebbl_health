import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/shared/login.dart';
import 'package:pebbl_health/shared/shared.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [
            TabLayout(
              imageName: "welcome_image",
              text1: "Welcome to ",
              text2: "Pebbl",
              text3: "Your Healthcare Companion",
              pageNo: 0,
            ),
            TabLayout(
              imageName: "vitals_image",
              text1: "Record your vitals",
              text2: "",
              text3:
                  "Use the device to measure your Heart Rate, SpO2, Body Temperature and Lung Health",
              pageNo: 1,
            ),
            TabLayout(
              imageName: "teleconsult_image",
              text1: "Teleconsult your Doctor",
              text2: "",
              text3:
                  "Chat or video call your doctor, get timely reminders to take prescribed medicines",
              pageNo: 2,
            ),
            TabLayout(
              imageName: "records_image",
              text1: "Store Health Records",
              text2: "",
              text3: "Past Health records, Diagnostic reports, Vital records",
              pageNo: 3,
            ),
            TabLayout(
              imageName: "order_image",
              text1: "Order Tests and Medicines",
              text2: "",
              text3:
                  "Get online delivery of medicines, Book tests at diagnostic centres",
              pageNo: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class TabLayout extends StatelessWidget {
  final String imageName, text1, text2, text3;
  final int pageNo;

  TabLayout(
      {required this.imageName,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.pageNo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset("assets/images/background.svg"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
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
                Text(
                  text3,
                  style: textStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.04),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DotsIndicator(
                      dotsCount: 5,
                      position: pageNo.toDouble(),
                      decorator: DotsDecorator(
                          size: Size(5, 5),
                          activeSize: Size(7, 7),
                          color: Colors.grey[300]!,
                          activeColor: primaryColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageTransition(
                              child: Login(),
                              type: PageTransitionType.rightToLeft));
                        },
                        child: Text(
                          pageNo == 4 ? "Next" : "Skip",
                          style: textStyle,
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
