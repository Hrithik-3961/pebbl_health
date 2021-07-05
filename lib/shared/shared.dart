import 'package:flutter/material.dart';

const primaryColor = Color(0xffFF6D6D);
const primaryColorTint = Color(0xffFF6767);
const secondaryColor = Color(0xff1D2366);

const textStyle = TextStyle(
  color: secondaryColor,
);

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.grey),
  focusColor: Colors.grey,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  disabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
);
