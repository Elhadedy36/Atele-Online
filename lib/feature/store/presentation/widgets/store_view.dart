
import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:atele_online/feature/store/presentation/views/StoreView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoreTabViewBuilder extends StatelessWidget {
  const StoreTabViewBuilder({super.key});

  @override

  Widget build(BuildContext context) {
    final extraData = GoRouter.of(context).state!.extra as CategoryModel;

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
          body:  TabBarView(children: [
          StoreView
          (
            isForRent: false,
            categoryName: extraData.categoryName,
          ),
            StoreView
            (
              isForRent: true,
            categoryName: extraData.categoryName,
            ),
          ]),
        ));
  }
}
