import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/feature/auth/presentation/view/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text('Atele Online',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp,color: AppColors.secondaryColor),),
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: CustomScrollView
        (
          slivers: 
          [
            SliverToBoxAdapter(child: Image.asset(Assets.imagesSignin),),
            SliverToBoxAdapter(child: CustomTextFormField(labelText: 'frist name'),),
            SliverSizedBox(15.h),
            SliverToBoxAdapter(child: CustomTextFormField(labelText: 'last name'),),
            SliverSizedBox(15.h),
            SliverToBoxAdapter(child: CustomTextFormField(labelText: 'email'),),
            SliverSizedBox(15.h),
            SliverToBoxAdapter(child: CustomTextFormField(labelText: 'password'),),
            SliverSizedBox(15.h),
            SliverToBoxAdapter(child: CustomBtn(text: 'Sign Up', color: AppColors.primaryColor, textcolor: AppColors.secondaryColor,onPressed: (){},),),
            SliverToBoxAdapter(child: HaveAnAccountWidget(text1: 'Already have an account ?',text2: ' Sign In',onTap: (){customNavigaeReplacement(context, path: '/signin');},),)
          ],
        ),
      ),
    );
  }
}