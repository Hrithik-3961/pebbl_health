import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/shared/shared.dart';
import 'package:pebbl_health/sign_up.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String emailId = "";
  String password = "";
  bool obscureText = true;

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Welcome,",
                                style: textStyle.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.1),
                              ),
                            ),
                          ),
                          Text(
                            "Sign in to continue!",
                            style: textStyle.copyWith(
                                color: Colors.grey[600],
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter an email id'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => emailId = val.trim());
                                    },
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Email id",
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.grey,
                                        )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    validator: (val) => val!.length < 6
                                        ? 'Enter a password with at least 6 characters'
                                        : null,
                                    obscureText: obscureText,
                                    onChanged: (val) {
                                      setState(() => password = val.trim());
                                    },
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Password",
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            obscureText
                                                ? Icons.remove_red_eye
                                                : Icons.remove_red_eye_outlined,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() =>
                                                obscureText = !obscureText);
                                          },
                                        )),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    "Forgot password?",
                                    style: textStyle.copyWith(
                                        color: Colors.grey[600]),
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
                                                    child: Home(),
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
                                          "Login",
                                          style: textStyle.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.2),
                            child: Row(children: <Widget>[
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    child: Divider(
                                      color: Colors.grey,
                                    )),
                              ),
                              Text(
                                "or",
                                style: textStyle.copyWith(color: Colors.grey),
                              ),
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    child: Divider(
                                      color: Colors.grey,
                                    )),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Center(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      "assets/images/google_logo.svg"))),
                          Expanded(child: Container()),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: "I'm a new user. ",
                                  style: textStyle.copyWith(color: Colors.grey),
                                  children: [
                                    TextSpan(
                                        text: "Sign up",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                PageTransition(
                                                    child: SignUp(),
                                                    type: PageTransitionType
                                                        .rightToLeft),
                                                (route) => false);
                                          },
                                        style: textStyle),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            );
          })),
    );
  }
}
