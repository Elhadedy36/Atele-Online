import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_drawer.dart';
import 'package:atele_online/feature/categories/presentation/widgets/custom_category_card.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer:const CustomDrawerProfile(),

      appBar: customAppBar(title: AppStrings.categories),
      body: const CustomCategoryCard(),
    );
  }
}
