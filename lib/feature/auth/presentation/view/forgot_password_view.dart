import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/feature/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:atele_online/feature/auth/presentation/widgets/forgot_password_image.dart';
import 'package:atele_online/feature/auth/presentation/widgets/forgot_password_sub_titl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: SizedBox(
          height: 108.h,
        )),
        SliverSizedBox(40.h),
        const SliverToBoxAdapter(
          child: ForgotPasswordImage(),
        ),
        SliverSizedBox(20.h),
        const SliverToBoxAdapter(
          child: ForgotPasswordSubTitle(),
        ),
        SliverSizedBox(20.h),
        const SliverToBoxAdapter(
          child: CustomForgotPasswordForm(),
        )
      ]),
    );
  }
}
