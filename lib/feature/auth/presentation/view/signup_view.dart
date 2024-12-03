import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/auth/presentation/view/signin_view.dart';
import 'package:atele_online/feature/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:atele_online/feature/auth/presentation/widgets/signin_form.dart';
import 'package:atele_online/feature/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Atele Online',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: AppColors.secondaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: CustomScrollView(
          slivers: [
            SliverSizedBox(200.h),
            SliverToBoxAdapter(
              child: SignupForm(),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: 'Already have an account ?',
                text2: AppStrings.signIn,
                onTap: () {
                  customNavigaeReplacement(context, path: '/signin');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
