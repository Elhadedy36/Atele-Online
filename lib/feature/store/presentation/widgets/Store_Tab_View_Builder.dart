import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:atele_online/feature/store/presentation/views/StoreView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';

class StoreTabViewBuilder extends StatelessWidget {
  const StoreTabViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // Access category from the StoreCubit
    final selectedCategory = context.read<SharedDataCubit>().state["selectedCategory"] as CategoryModel?;

    if (selectedCategory == null) {
      return Scaffold(
        body: Center(child: Text("No category selected")),
      );
    }

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
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // StoreView for Sale
            StoreView(
              isForRent: false,
              categoryName: selectedCategory.categoryName,
            ),
            // StoreView for Rent
            StoreView(
              isForRent: true,
              categoryName: selectedCategory.categoryName,
            ),
          ],
        ),
      ),
    );
  }
}
