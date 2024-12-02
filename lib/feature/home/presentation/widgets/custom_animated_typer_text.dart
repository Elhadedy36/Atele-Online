import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedTyperText extends StatelessWidget {
  const AnimatedTyperText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0.h,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 20.0, color: Colors.black),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(AppStrings.helloDear,
                speed: const Duration(milliseconds: 1000)),
          ],
        ),
      ),
    );
  }
}
