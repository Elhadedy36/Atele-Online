import 'package:atele_online/core/database/cache/cache_helper.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/feature/profile/presentation/cubit/account_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawerProfile extends StatelessWidget {
  const CustomDrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountDetailsCubit()..getUserDetails(),
      child: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
        builder: (context, state) {
          if (state is AccountDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is AccountDetailsLoaded) {
            final userDetails = state.accountDetailsModel;
            return Drawer(
              child: SingleChildScrollView( 
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text(userDetails.fristname),
                      accountEmail: Text(userDetails.email),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.imagesDrees5,
                          ),
                          fit: BoxFit.cover,
                          scale: 2,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_box),
                      title: const Text('Account'),
                      onTap: () {
                        customNavigate(context, path: '/AccountView');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        context.read<AccountDetailsCubit>().signOut();
                        CacheHelper().saveData(key: 'isSignedIn', value: false);
                        customNavigate(context, path: '/signin');
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Failed to load user details.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
