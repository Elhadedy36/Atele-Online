import 'package:atele_online/core/database/cache/cache_helper.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/feature/onboarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: CustomBtn(
              text: 'Create account',
              onPressed: () {
                CacheHelper().saveData(key: 'onboardingdone', value: true);

                customNavigate(context, path: '/signup');
              },
              textcolor: AppColors.secondaryColor,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
              onTap: () {
                CacheHelper().saveData(key: 'onboardingdone', value: true);

                customNavigaeReplacement(context, path: '/signin');
              },
              child: const Text(
                'Sign In Now',
              )),
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
        child: CustomBtn(
          text: 'Next',
          onPressed: () {
            controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInCirc);
          },
          textcolor: AppColors.secondaryColor,
        ),
      );
    }
  }
}
