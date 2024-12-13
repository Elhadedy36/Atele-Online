import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/feature/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageViewHome extends StatelessWidget {
  CustomPageViewHome({super.key});
  final List images = [
    Assets.imagesSplash2,
    Assets.imagesOnboarding,
    Assets.imagesOnboarding,
    Assets.imagesOnboarding,
    Assets.imagesOnboarding,
  ];
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return BlocListener<HomeCubit, int>(
      listener: (context, state) {
         _pageController.animateToPage(
            state,
            duration: const Duration(milliseconds: 1700),
            curve: Curves.easeInOut,
          );
      },
      child: Container(
    
        height: 270.h,
        child: PageView.builder(
           controller: _pageController,
            itemCount: images.length,
            
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.borderColor,
                        width: 2),
                    // borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage(
                        images[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
      ),
    );
  }
}
