import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, path: '/forgotPassword');
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.poppins400style20
              .copyWith(fontSize: 12.sp)
              .copyWith(color: Colors.pink[700]),
        ),
      ),
    );
  }
}
