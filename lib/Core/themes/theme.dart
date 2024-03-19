import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/Core/Colors.dart';
import 'package:taskati/Core/TextStyle.dart';

class AppThemes {
  static ThemeData appLightTheme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.white, foregroundColor: AppColor.primary),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColor.primary,
          // secondary: ,
          background: AppColor.white,
          // text
          onSurface: AppColor.black,
          error: AppColor.red,
          seedColor: AppColor.primary),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColor.white,
      ),
      timePickerTheme: TimePickerThemeData(backgroundColor: AppColor.white),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallStyle(),
          prefixIconColor: AppColor.primary,
          suffixIconColor: AppColor.primary,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.red))));
  // static ThemeData appDarkTheme = ThemeData(
  //     fontFamily: GoogleFonts.poppins().fontFamily,
  //     scaffoldBackgroundColor: AppColor.darkBackground,
  //     datePickerTheme:
  //         DatePickerThemeData(backgroundColor: AppColor.darkBackground),
  //     appBarTheme: AppBarTheme(
  //         backgroundColor: AppColor.darkBackground,
  //         foregroundColor: AppColor.primary),
  //     timePickerTheme: TimePickerThemeData(
  //       backgroundColor: AppColor.darkBackground,
  //       dialBackgroundColor: AppColor.darkBackground,
  //     ),
  //     colorScheme: ColorScheme.fromSeed(
  //         primary: AppColor.primary,
  //         background: AppColor.darkBackground,
  //         // text
  //         onSurface: AppColor.white,
  //         seedColor: AppColor.primary),
  //     inputDecorationTheme: InputDecorationTheme(
  //         hintStyle: getSmallStyle(),
  //         prefixIconColor: AppColor.primary,
  //         suffixIconColor: AppColor.primary,
  //         contentPadding:
  //             const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //         enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(color: AppColor.primary)),
  //         focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(color: AppColor.primary)),
  //         errorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(color: AppColor.red)),
  //         focusedErrorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(color: AppColor.red)))
  //     );
}
