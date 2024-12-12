import 'package:atele_online/core/functions/get_outline_InputBorder.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.obsecure,
    required this.controller,
    this.onTap, this.enabled,
  });
  final String labelText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obsecure;
final  bool? enabled;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onTap: onTap,
      obscureText: obsecure ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null; // Return null if validation passes
      },
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
        border: getBorderStyle(14, AppColors.primaryColor),
        enabledBorder: getBorderStyle(14, AppColors.primaryColor),
        focusedBorder: getBorderStyle(14, AppColors.primaryColor),
      ),
    );
  }
}
