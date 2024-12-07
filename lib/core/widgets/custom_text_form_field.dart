import 'package:atele_online/core/functions/get_outline_InputBorder.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.obsecure,
    required this.controller, this.onTap,
  });
  final String labelText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obsecure;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        labelStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black
               ) ,
        border: getBorderStyle(20, AppColors.primaryColor),
        enabledBorder: getBorderStyle(20, AppColors.primaryColor),
        focusedBorder: getBorderStyle(20, AppColors.primaryColor),
      ),
    );
  }
}
