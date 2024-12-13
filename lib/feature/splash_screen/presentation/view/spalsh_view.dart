import 'package:atele_online/core/database/cache/cache_helper.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
      bool isonboard = CacheHelper().getData(key: 'onboardingdone') ?? false;
      if (isonboard) {
        CacheHelper().getData(key: 'isSignedIn') == null
            ? customNavigaeReplacement(context, path: '/signin')
            : CacheHelper().getData(key: 'isSignedIn')
                ? customNavigaeReplacement(context, path: '/HoomNavBar')
                : customNavigaeReplacement(context, path: '/signin');
      } else {
        customNavigaeReplacement(context, path: '/onboarding');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Assets.imagesSplash2),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
            top: 400.h,
            left: 170.w,
            child: const CircularProgressIndicator(
              color: Colors.black,
            ))
      ]),
    );
  }
}
