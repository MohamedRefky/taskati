import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/Core/Colors.dart';

TextStyle getTitleStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
      color: color ?? AppColor.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: fontSize ?? 28);
}
TextStyle getSmollStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColor.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontSize: fontSize ?? 12);
}
TextStyle getBodyStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColor.grey,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontSize: fontSize ??16);
}