import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/categories/presentation/widgets/custom_dress_card.dart';
import 'package:flutter/material.dart';

class WeddingDressView extends StatelessWidget {
  const WeddingDressView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: customAppBar(
            title: AppStrings.weddingDress,
            tabBar: const TabBar(
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.greyColor,
              tabs: [
              Tab(text: AppStrings.forSale),
              Tab(text: AppStrings.forRent),
              
            ]),
          ),
          body: const TabBarView(children: [
          CustomDressCard(),
            CustomDressCard(),
          ]),
        ));
  }
}
