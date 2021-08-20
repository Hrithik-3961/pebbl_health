import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pebbl_health/complete_profile.dart';
import 'package:pebbl_health/login.dart';
import 'package:pebbl_health/shared/shared.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String emailId = "";
  String password = "";
  String confirmPassword = "";
  bool obscureText1 = true;
  bool obscureText2 = true;

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
                    Center(child: SvgPicture.asset("assets/images/background.svg")),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Account,",
                            style: textStyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.1),
                          ),
                          Text(
                            "Sign Up to get started!",
                            style: textStyle.copyWith(
                                color: Colors.grey[600],
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06),
                          ),
                          Spacer(),
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
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter an email id'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => emailId = val.trim());
                                    },
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Email id",
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    validator: (val) => val!.length < 6
                                        ? 'Enter a password with at least 6 characters'
                                        : password != confirmPassword
                                            ? "Entered password are different"
                                            : null,
                                    obscureText: obscureText1,
                                    onChanged: (val) {
                                      setState(() => password = val.trim());
                                    },
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Password",
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            obscureText1
                                                ? Icons.remove_red_eye
                                                : Icons.remove_red_eye_outlined,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() =>
                                                obscureText1 = !obscureText1);
                                          },
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
                                        : password != confirmPassword
                                            ? "Entered password are different"
                                            : null,
                                    obscureText: obscureText2,
                                    onChanged: (val) {
                                      setState(
                                          () => confirmPassword = val.trim());
                                    },
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Confirm Password",
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            obscureText2
                                                ? Icons.remove_red_eye
                                                : Icons.remove_red_eye_outlined,
                                            color: Colors.grey[400],
                                          ),
                                          onPressed: () {
                                            setState(() =>
                                                obscureText2 = !obscureText2);
                                          },
                                        )),
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return CompleteProfile();
                                                  },),
                                                );
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02)),
                                        color: primaryColorTint,
                                        child: Text(
                                          "Sign Up",
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
                          Spacer(),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: "I'm already a user. ",
                                  style: textStyle.copyWith(color: Colors.grey),
                                  children: [
                                    TextSpan(
                                        text: "Log in",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return Login();
                                                  },),
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
