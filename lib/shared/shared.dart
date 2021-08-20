import 'package:flutter/material.dart';

const primaryColor = Color(0xffFF6D6D);
const primaryColorTint = Color(0xffFF6767);
const secondaryColor = Color(0xff1D2366);

const textStyle = TextStyle(
  color: secondaryColor,
);

var textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.grey[400]),
  focusColor: Colors.grey[400]!,
  fillColor: Colors.white,
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!),borderRadius: BorderRadius.circular(17)),
  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!),borderRadius: BorderRadius.circular(17)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!),borderRadius: BorderRadius.circular(17)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),borderRadius: BorderRadius.circular(17)),
  focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),borderRadius: BorderRadius.circular(17)),
);
