import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 1.3,
    iconTheme: const IconThemeData(color: AppColors.greyColor),
    actionsIconTheme: const IconThemeData(color: AppColors.greyColor),
    shadowColor: Colors.grey,
    title: Text(title,style: const TextStyle(color: AppColors.greyColor)),
    centerTitle: true,
    backgroundColor: AppColors.secondaryColor,
actions: actions ??
        [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
            
            
            },
          ),
        ],
  );
}

// actions: []