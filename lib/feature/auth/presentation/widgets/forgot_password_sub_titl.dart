import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordSubTitle extends StatelessWidget {
  const ForgotPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Text(
        AppStrings.forgotPasswordSubTitel,
        style: CustomTextStyles.poppins400style20
            .copyWith(fontSize: 16.sp, color: Colors.pink[300]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
