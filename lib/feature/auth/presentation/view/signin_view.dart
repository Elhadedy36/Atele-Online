import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/feature/auth/presentation/widgets/custom_sign_in_image.dart';
import 'package:atele_online/feature/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:atele_online/feature/auth/presentation/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: CustomScrollView(
        slivers: [
          SliverSizedBox(120.h),
          const SliverToBoxAdapter(child: SignInImage()),
          const SliverToBoxAdapter(
            child: SignInForm(),
          ),
          SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: 'Dont have an account ?',
              text2: ' Sign Up',
              onTap: () {
                customNavigate(context, path: '/signup');
              },
            ),
          ),
          SliverSizedBox(8.h),
        ],
      ),
    ));
  }
}
