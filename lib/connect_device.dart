import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/completion.dart';
import 'package:pebbl_health/shared/shared.dart';

class ConnectDevice extends StatefulWidget {
  const ConnectDevice({Key? key}) : super(key: key);

  @override
  _ConnectDeviceState createState() => _ConnectDeviceState();
}

class _ConnectDeviceState extends State<ConnectDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Text(
                "Connect your Device",
                style: textStyle.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.08),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Scan the QR Code on your device to connect",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: Completion(),
                              type: PageTransitionType.rightToLeft),
                          (route) => false);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.02)),
                    color: primaryColorTint,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        ),
                        Text(
                          "Scan QR Code",
                          style: textStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Positioned.fill(
            child: SvgPicture.asset("assets/images/qr_code.svg"),
          ),
        ),
      ]),
    );
  }
}
