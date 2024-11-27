import 'package:atele_online/app/atele_online.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5),()
    {
    customNavigaeReplacement(context, path: '/onboarding');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: AppColors.primaryColor,
      body:Stack(
        children: [Align(
          alignment: Alignment.center,
          child: Container
          (
            width: double.infinity,
            height: double.infinity, 
            
            decoration: const BoxDecoration
            (
              image: const DecorationImage
              (
                image: AssetImage(Assets.imagesSplash2),
                fit: BoxFit.cover
              )
            ),
          
          ),
        ),
        
        Positioned(
          top: 400.h,
          left: 170.w,
          child: CircularProgressIndicator())
        ]
      ) ,
    );
  }
}