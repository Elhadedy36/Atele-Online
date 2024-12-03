import 'package:atele_online/core/functions/custom_toast.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/core/widgets/custom_text_form_field.dart';
import 'package:atele_online/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is SignInSuccess)
        {
          showToast('Signed in successfully');
        }
        else if(state is SignInError)
        {
          showToast(state.errmsg);
        }
      },
      builder: (context, state) {
        return Column(children: [
          Form(
            key: context.read<AuthCubit>().SignInFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'Email',
                  controller: context.read<AuthCubit>().email_in,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextFormField(
                  labelText: 'Password',
                  controller: context.read<AuthCubit>().password_in,
                ),
                SizedBox(
                  height: 12.h,
                ),
              state is SignInLoading? const CircularProgressIndicator():  CustomBtn(
                  text: AppStrings.signIn,
                  onPressed: () 
                  {
                    if(context.read<AuthCubit>().SignInFormKey.currentState!.validate())
                    {
                      context.read<AuthCubit>().SignInWithEmailAndPassword();
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
