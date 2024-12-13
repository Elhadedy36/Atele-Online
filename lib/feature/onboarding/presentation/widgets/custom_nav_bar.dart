import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 20.h),
      child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
              onTap: onTap,
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))),
    );
  }
}
