import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              customNavigate(context, path: '/WeddingDressView');
            },
            child: Container(
              alignment: Alignment.center,
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor, width: 2),
                borderRadius: BorderRadius.circular(8.r),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.9,
                  image: AssetImage(Assets.imagesDrees5),
                ),
              ),
              child: Text(AppStrings.weddingDress,
                  style: CustomTextStyles.Pacifico300style34),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 8.h)),
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              customNavigate(context, path: '/EveningDressView');
            },
            child: Container(
              alignment: Alignment.center,
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor, width: 2),
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.9,
                    image: AssetImage(Assets.imagesDrees),
                  )),
              child: Text(AppStrings.eveningDress,
                  style: CustomTextStyles.Pacifico300style34),
            ),
          ),
        )
      ]),
    );
  }
}
