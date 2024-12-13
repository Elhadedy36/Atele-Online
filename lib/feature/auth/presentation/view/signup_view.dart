import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/auth/presentation/widgets/custom_sign_up_image.dart';
import 'package:atele_online/feature/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:atele_online/feature/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SignUpImage()),
            const SliverToBoxAdapter(
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
