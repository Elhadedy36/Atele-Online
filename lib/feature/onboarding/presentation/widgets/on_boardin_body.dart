import 'package:atele_online/app/atele_online.dart';
import 'package:atele_online/feature/onboarding/data/models/on_boarding_model.dart';
import 'package:atele_online/feature/onboarding/presentation/widgets/custom_smooth_page_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class onBoardingBody extends StatelessWidget {
  const onBoardingBody({super.key, required this.controller, this.onPageChanged});

  final PageController controller;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800.h,
      child: PageView.builder(
        controller: controller,
        itemCount: onBoardingData.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onBoardingData[index].imagePath),
                fit: BoxFit.cover, // Makes the image cover the entire screen
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70.h,),  
                // Title and subtitle will appear on top of the image
                Text(
                  onBoardingData[index].title,
                  style: TextStyle(color: const Color.fromARGB(255, 244, 235, 179),fontSize: 30.sp,fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  onBoardingData[index].subtitle,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
