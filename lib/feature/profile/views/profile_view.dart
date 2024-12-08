import 'package:atele_online/core/database/cache/cache_helper.dart';
import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/custom_toast.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
if(state is SignOutSuccess)
{
  showToast('Signed out successfully');
  customNavigaeReplacement(context, path: '/signin');
  CacheHelper().saveData(key: 'isSignedIn', value: false);
}else if (state is SignOutError)
{
showToast(state.errmsg);
}
        },
        builder: (context, state) {
          return Scaffold(
            drawer: const Drawer(),
            appBar: customAppBar(title: AppStrings.profile),
            body: Center(
              child: CustomBtn(text: 'Logout', onPressed: () 
              {
                context.read<AuthCubit>().SignOut();
              }),
            ),
          );
        },
      ),
    );
  }
}
