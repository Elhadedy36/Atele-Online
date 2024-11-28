import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: AppColors.primaryColor,
centerTitle: true,
title: Text('Atele Online',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp,color: AppColors.secondaryColor),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: CustomScrollView
        (
          
          slivers: 
          [
        SliverSizedBox(50.h),
            SliverToBoxAdapter(child: Image.asset(Assets.imagesSignin),),
                    SliverSizedBox(12.h),

        SliverToBoxAdapter(child: CustomTextFormField(labelText:  'Email'),),
                SliverSizedBox(16.h),

        SliverToBoxAdapter(child: CustomTextFormField(labelText:  'Password'),),
        SliverSizedBox( 16.h),
        SliverToBoxAdapter(child: CustomBtn(text: 'Sign In', color: AppColors.primaryColor, textcolor: AppColors.secondaryColor,onPressed: (){},),),
        SliverToBoxAdapter(child: HaveAnAccountWidget(text1: 'Dont have an account ?',text2: ' Sign Up',onTap: (){customNavigaeReplacement(context, path: '/signup');},),)
          ],
        ),
      ),
    );
  }
}



class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.labelText, this.onChanged, this.onFieldSubmitted, this.suffixIcon, this.obsecure,});
final String labelText;
final Function(String)? onChanged;
final Function(String)? onFieldSubmitted;
final bool? obsecure;
final Widget? suffixIcon;
  @override

  Widget build(BuildContext context) {
    return TextFormField( 
      
      obscureText: obsecure??false,
    
     validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      return null;  // Return null if validation passes
    },
    
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        
        border: getBorderStyle(20, AppColors.primaryColor),
        enabledBorder: getBorderStyle(20, AppColors.primaryColor),
        focusedBorder: getBorderStyle(20, AppColors.primaryColor),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle(double borderradius, Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderradius),
    borderSide: BorderSide(color: color, width: 2),
  );
}


SliverToBoxAdapter SliverSizedBox(double height) 
{
  return SliverToBoxAdapter(
    child: SizedBox(height: height,),
  );
}




class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      this.onPressed,
      required this.text,
      required this.color,
      required this.textcolor});
  final void Function()? onPressed;
  final String text;
  final Color color;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.bold, color: textcolor),
          )),
    );
  }
}

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key, required this.text1, required this.text2, this.onTap});
final String text1;
final String text2;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Align
      (
        alignment: Alignment.center,
        child: Text.rich(TextSpan(children: 
        [
          TextSpan(text: text1,style: TextStyle(color: Colors.black.withOpacity(0.6))),
          TextSpan(text: text2,style: TextStyle(color: Colors.blue))
        ])),
      ),
    );
  }
}