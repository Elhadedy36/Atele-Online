import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/feature/auth/presentation/view/signin_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.color, required this.text, this.onPressed,   this.textcolor});
final Color? color;
final String text;
final VoidCallback? onPressed;
final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text,style: TextStyle(color: textcolor,fontSize: 16.sp,fontWeight: FontWeight.bold),), 
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: color??AppColors.primaryColor),
      ),
    );
  }
}
