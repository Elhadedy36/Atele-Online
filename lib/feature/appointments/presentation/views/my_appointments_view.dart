import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/widgets/custom_drawer.dart';
import 'package:atele_online/core/widgets/custom_list_title.dart';
import 'package:flutter/material.dart';

class MyAppointmentsView extends StatelessWidget {
  const MyAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: const CustomDrawerProfile(),
      appBar: customAppBar(title: 'My Appointments'),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: CustomListTile(
              image: AssetImage(Assets.imagesDrees),
              title: 'Red Dress ',
              subtitle: 'Evening Dress',
              trallingText: '\$2000',
            ),
          )
        ]),
      ),
    );
  }
}
