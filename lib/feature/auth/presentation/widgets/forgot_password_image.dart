import 'package:atele_online/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235.h,
      width: 235.w,
      child: Image.asset(Assets.imagesResetpasswordcuate),
    );
  }
}
