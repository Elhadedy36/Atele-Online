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

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToast('Check your email to reset your password');
          customNavigaeReplacement(context, path: '/signin');
        } else if (state is ResetPasswordFailuerState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authcubit = BlocProvider.of<AuthCubit>(context);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: authcubit.forgotPasswordFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: AppStrings.email,
                    onChanged: (emailAddress) {
                      authcubit.emailAddress = emailAddress;
                    },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  state is ResetPasswordLoadingState
                      ? const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : CustomBtn(
                          text: AppStrings.sendResetPasswordLink,
                          textcolor: Colors.white,
                          onPressed: () async {
                            if (authcubit.forgotPasswordFormKey.currentState!
                                .validate()) {
                              await authcubit.resetPasswordWithEmail();
                            }
                          }),
                ],
              )),
        );
      },
    );
  }
}
