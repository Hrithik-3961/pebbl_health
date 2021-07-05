import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/phone_number.dart';
import 'package:pebbl_health/shared/shared.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<DateTime> _dateTimeNotifier =
      ValueNotifier<DateTime>(DateTime.now());
  final TextEditingController _controller = TextEditingController();

  String firstName = "";
  String lastName = "";
  String gender = "";
  String dob = "";
  double weight = 0.0;
  String weightUnit = "";
  double height = 0.0;
  String heightUnit = "";
  String genderDropDownValue = "0";
  String weightDropDownValue = "0";
  String heightDropDownValue = "0";

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
                          Text(
                            "Complete your profile,",
                            style: textStyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.09),
                          ),
                          Text(
                            "Complete your details",
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
                                        ? 'Enter your first name'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => firstName = val.trim());
                                    },
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "First Name",
                                        prefixIcon: Icon(
                                          Icons.perm_identity,
                                          color: Colors.grey,
                                        )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter your last name'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => lastName = val.trim());
                                    },
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Last Name",
                                        prefixIcon: Icon(
                                          Icons.perm_identity,
                                          color: Colors.grey,
                                        )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  DropdownButtonFormField(
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Gender",
                                        prefixIcon: Icon(
                                          Icons.transgender,
                                          color: Colors.grey,
                                        )),
                                    value: genderDropDownValue,
                                    onChanged: (val) {
                                      setState(() {
                                        genderDropDownValue = val.toString();
                                        gender = genderDropDownValue == "1"
                                            ? "Male"
                                            : genderDropDownValue == "2"
                                                ? "Female"
                                                : genderDropDownValue == "3"
                                                    ? "Others"
                                                    : "";
                                      });
                                    },
                                    validator: (val) => val.toString() == "0"
                                        ? "Select your Gender"
                                        : null,
                                    items: [
                                      DropdownMenuItem(
                                          value: "0",
                                          child: Text(
                                            "Select your Gender",
                                            style: textStyle.copyWith(
                                                color: Colors.grey),
                                          )),
                                      DropdownMenuItem(
                                          value: "1", child: Text("Male")),
                                      DropdownMenuItem(
                                          value: "2", child: Text("Female")),
                                      DropdownMenuItem(
                                          value: "3", child: Text("Others")),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  TextFormField(
                                    readOnly: true,
                                    enableInteractiveSelection: false,
                                    controller: _controller,
                                    onTap: () async {
                                      await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  _dateTimeNotifier.value,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now())
                                          .then((value) {
                                        _dateTimeNotifier.value = value!;
                                        setState(() {
                                          dob = DateFormat("dd/MM/yyyy")
                                              .format(_dateTimeNotifier.value);
                                          _controller.value =
                                              TextEditingValue(text: dob);
                                        });
                                      });
                                    },
                                    validator: (val) => val!.isEmpty
                                        ? 'Select you date of birth'
                                        : null,
                                    textInputAction: TextInputAction.next,
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Date of Birth",
                                        prefixIcon: Icon(
                                          Icons.calendar_today,
                                          color: Colors.grey,
                                        )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  Stack(
                                    alignment: AlignmentDirectional.centerEnd,
                                    children: [
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        validator: (val) => val!.isEmpty
                                            ? 'Enter your weight'
                                            : null,
                                        onChanged: (val) {
                                          setState(() =>
                                              weight = val.trim() as double);
                                        },
                                        decoration:
                                            textInputDecoration.copyWith(
                                          labelText: "Weight",
                                          prefixIcon: Icon(
                                            Icons.monitor_weight,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: weightDropDownValue,
                                            onChanged: (val) {
                                              weightDropDownValue =
                                                  val.toString();
                                              weightUnit =
                                                  weightDropDownValue == "0"
                                                      ? " kg"
                                                      : " lbs";
                                            },
                                            items: [
                                              DropdownMenuItem(
                                                  value: "0",
                                                  child: Text("kg")),
                                              DropdownMenuItem(
                                                  value: "1",
                                                  child: Text("lbs"))
                                            ]),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  Stack(
                                    alignment: AlignmentDirectional.centerEnd,
                                    children: [
                                      TextFormField(
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        validator: (val) => val!.isEmpty
                                            ? 'Enter your height'
                                            : null,
                                        onChanged: (val) {
                                          setState(() =>
                                              height = val.trim() as double);
                                        },
                                        decoration:
                                            textInputDecoration.copyWith(
                                          labelText: "Height",
                                          prefixIcon: Icon(
                                            Icons.height,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: heightDropDownValue,
                                            onChanged: (val) {
                                              heightDropDownValue =
                                                  val.toString();
                                              heightUnit =
                                                  heightDropDownValue == "0"
                                                      ? " ft"
                                                      : " cm";
                                            },
                                            items: [
                                              DropdownMenuItem(
                                                  value: "0",
                                                  child: Text("ft")),
                                              DropdownMenuItem(
                                                  value: "1", child: Text("cm"))
                                            ]),
                                      ),
                                    ],
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
                                                    child: PhoneNumber(),
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
                                          "Continue",
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
