import 'package:atele_online/core/functions/custom_toast.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:atele_online/core/widgets/custom_text_form_field.dart';
import 'package:atele_online/feature/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:atele_online/feature/auth/presentation/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          SliverSizedBox(300.h),
          SliverToBoxAdapter(
            child: SignInForm(),
          ),
          SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: 'Dont have an account ?',
              text2: ' Sign Up',
              onTap: () {
                customNavigaeReplacement(context, path: '/signup');
              },
            ),
          )
        ], 
      ),
    ));
  }
}
