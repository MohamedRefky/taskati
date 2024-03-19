import 'package:flutter/material.dart';
import 'package:taskati/Core/Colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.suffixIcon,
    this.width,
    this.maxLines,
    this.onChanged, this.controller,
  });

  final String hintText;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final double? width;
  final int? maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
         // helperStyle: getBodyStyle(fontSize: 43),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.red),
          ),
        ),
      ),
    );
  }
}
