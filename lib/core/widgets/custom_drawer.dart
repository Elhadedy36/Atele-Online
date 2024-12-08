import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDrawerProfile extends StatelessWidget {
  const CustomDrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(      
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@gmail.com'),
            currentAccountPicture:
                CircleAvatar(backgroundImage: AssetImage(Assets.imagesDrees)),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
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
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
