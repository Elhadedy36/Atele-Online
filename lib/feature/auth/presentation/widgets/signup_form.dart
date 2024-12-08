import 'package:atele_online/core/functions/custom_toast.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/core/widgets/custom_text_form_field.dart';
import 'package:atele_online/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is EmailVerificationsuccess)
        {
          showToast('check your email');
          customNavigaeReplacement(context, path: '/signin');
        }
        else if(state is SignUpError)
        {
          showToast(state.errmsg);
        }
      },
      builder: (context, state) {
        return Column(children: [
          Form(
            key: context.read<AuthCubit>().SignUpFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'frist name',
                  controller: context.read<AuthCubit>().fristname,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextFormField(
                  labelText: 'last name',
                  controller: context.read<AuthCubit>().lastname,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextFormField(
                  labelText: 'Email',
                  controller: context.read<AuthCubit>().email_up,
                ),
                SizedBox(
                  height: 12.h,
                ),
                 CustomTextFormField(
                  labelText: 'Phone Number',
                  controller: context.read<AuthCubit>().phone_num,
                ),
                SizedBox(
                  height: 12.h,
                ),
                 CustomTextFormField(
                  labelText: 'City',
                  controller: context.read<AuthCubit>().lacation_up,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextFormField(
                  labelText: 'Password',
                  controller: context.read<AuthCubit>().password_up,
                ),
                SizedBox(
                  height: 12.h,
                ),
              state is SignUpLoading? const CircularProgressIndicator():  CustomBtn(
                  text: AppStrings.signUp,
                  onPressed: () 
                  {
                    if(context.read<AuthCubit>().SignUpFormKey.currentState!.validate())
                    {
                      context.read<AuthCubit>().SignUpWithEmailAndPassword();
                    }
                  },
                  textcolor: AppColors.secondaryColor,

                )
              ],
            ),
          )
        ]);
      },
    );
  }
}