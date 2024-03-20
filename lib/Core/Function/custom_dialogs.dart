import 'package:flutter/material.dart';
import 'package:taskati/Core/utils/Colors.dart';


showErrorDialog(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColor.red, content: Text(text)));
}