import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/feature/onboarding/presentation/widgets/custo_nav_bar.dart';
import 'package:atele_online/feature/onboarding/presentation/widgets/custom_smooth_page_indicator.dart';
import 'package:atele_online/feature/onboarding/presentation/widgets/get_buttons.dart';
import 'package:atele_online/feature/onboarding/presentation/widgets/on_boardin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Full-screen background image
            onBoardingBody(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: SkipButton(
                onTap: () {
                  customNavigaeReplacement(context, path: '/signin');
                },
              ),
            ),
            // Smooth Indicator
            Positioned(
              bottom: 150.h, // Adjust based on desired position
              left: 150.w, 
              right: 0,
              child: CustomSmoothPageIndicator(controller: _controller),
            ),
            // Next Button or Create Account Button
            Positioned(
              bottom: 60.h, // Adjust based on desired position
              left: 0,
              right: 0,
              child: GetButtons(
                controller: _controller,
                currentIndex: currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
