import 'package:atele_online/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 270.w,
      child: Image.asset(Assets.imagesWedding),
    );
  }
}
