import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/custom_toast.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/core/widgets/custom_text_form_field.dart';
import 'package:atele_online/feature/profile/presentation/cubit/account_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.accountDetails,
        actions: [],
        context: context,
      ),
      body: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
        builder: (context, state) {
          if (state is AccountDetailsLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          } else if (state is AccountDetailsLoaded) {
            final userdetails = state.accountDetailsModel;
            return SingleChildScrollView( 
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.editProfile,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      enabled: false,
                      labelText: AppStrings.email,
                      controller:
                          TextEditingController(text: userdetails.email),
                    ),
                    SizedBox(height: 14.h),
                    CustomTextFormField(
                      labelText: AppStrings.name,
                      controller: context
                          .read<AccountDetailsCubit>()
                          .nameControllerEdit
                        ..text = userdetails.fristname,
                    ),
                    SizedBox(height: 14.h),
                    CustomTextFormField(
                      labelText: AppStrings.phone,
                      controller: context
                          .read<AccountDetailsCubit>()
                          .phoneControllerEdit
                        ..text = userdetails.phone,
                    ),
                    SizedBox(height: 14.h),
                    CustomTextFormField(
                      labelText: AppStrings.city,
                      controller: context
                          .read<AccountDetailsCubit>()
                          .cityControllerEdit
                        ..text = userdetails.location,
                    ),
                    SizedBox(height: 20.h), 
                    CustomBtn(
                      text: 'Save',
                      onPressed: () {
                        context.read<AccountDetailsCubit>().editAccountDetails();
                        showToast('Save');
                        customNavigaeReplacement(
                            context, path: '/HoomNavBar');
                      },
                      textcolor: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
