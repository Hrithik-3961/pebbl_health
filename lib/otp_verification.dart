import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/choose_location.dart';
import 'package:pebbl_health/shared/shared.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNo;

  OtpVerification({required this.phoneNo});

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _formKey = GlobalKey<FormState>();
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    Center(child: SvgPicture.asset("assets/images/background.svg")),
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
                                    text: "Enter the OTP sent to ",
                                    style: textStyle,
                                    children: [
                                      TextSpan(
                                          text: widget.phoneNo,
                                          style: textStyle.copyWith(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  OTPTextField(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    onChanged: (val) => otp = val.trim(),
                                    onCompleted: (val) {
                                      //TODO: verify
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "Didn't received the OTP? ",
                                          style: textStyle,
                                          children: [
                                            TextSpan(
                                                text: "Resend OTP ",
                                                style: textStyle.copyWith(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        //TODO: Resend OTP
                                                      }),
                                          ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.05,
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
                                                    child: ChooseLocation(),
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
                                          "Verify & Proceed",
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
