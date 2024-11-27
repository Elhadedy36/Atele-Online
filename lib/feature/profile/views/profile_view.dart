import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const Drawer(),
      appBar:customAppBar(title: 'Profile',),
      
    );
  }
}
