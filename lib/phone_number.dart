import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/otp_verification.dart';
import 'package:pebbl_health/shared/shared.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  String phoneNo = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Stack(children: [
                    Positioned.fill(
                      child: SvgPicture.asset("assets/images/background.svg"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: SvgPicture.asset(
                                    "assets/images/otp_verification_image.svg")),
                            Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.05),
                              child: Text(
                                "OTP Verification",
                                style: textStyle.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "We will send you a ",
                                    style: textStyle,
                                    children: [
                                      TextSpan(
                                          text: "one time password ",
                                          style: textStyle.copyWith(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: "on this mobile number",
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Text(
                              "Enter your Mobile Number",
                              style: textStyle,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.08),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      validator: (val) => val!.length != 10
                                          ? "Enter a valid phone number"
                                          : null,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.08),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.055,
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (_formKey.currentState!.validate())
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                PageTransition(
                                                    child: OtpVerification(),
                                                    type: PageTransitionType
                                                        .rightToLeft),
                                                (route) => false);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02)),
                                        color: primaryColorTint,
                                        child: Text(
                                          "Get OTP",
                                          style: textStyle.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    )
                  ]),
                ),
              ),
            );
          })),
    );
  }
}
