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
    Future.delayed(const Duration(seconds: 2),()
    {
    customNavigaeReplacement(context, path: '/HoomNavBar');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: AppColors.primaryColor,
      body:Align(
        alignment: Alignment.bottomCenter,
        child: Container
        (
          width: 500.w,
          height: 500.h, 
          
          decoration: const BoxDecoration
          (
            image: const DecorationImage
            (
              image: AssetImage(Assets.imagesSplashatele),
              fit: BoxFit.cover
            )
          ),
        
        ),
      ) ,
    );
  }
}