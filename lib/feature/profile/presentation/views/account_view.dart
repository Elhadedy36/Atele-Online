import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/utils/app_strings.dart';
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
        appBar: customAppBar(title: AppStrings.accountDetails, actions: []),
        body: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
            builder: (context, state) {
          if (state is AccountDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AccountDetailsLoaded) {
            final userdetails = state.accountDetailsModel;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      enabled: false,
                      labelText: 'email',
                      controller:
                          TextEditingController(text: userdetails.email),
                    ),
                    SizedBox(height: 12.h),
                    CustomTextFormField(
                      labelText: 'Name',
                      controller: TextEditingController(
                          text: userdetails.fristname + userdetails.lastname),
                    ),
                    SizedBox(height: 12.h),
                    CustomTextFormField(
                      labelText: 'Phone',
                      controller:
                          TextEditingController(text: userdetails.phone),
                    ),
                    SizedBox(height: 12.h),
                    CustomTextFormField(
                      labelText: 'Address',
                      controller: TextEditingController(),
                    ),
                  ]),
            );
          } else {
            return const Text('Error');
          }
        }));
  }
}
