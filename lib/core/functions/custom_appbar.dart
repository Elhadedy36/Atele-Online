import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  TabBar? tabBar,
}) {
  return AppBar(
    elevation: 0.2,
    iconTheme: const IconThemeData(color: AppColors.greyColor),
    actionsIconTheme: const IconThemeData(color: AppColors.greyColor),
    shadowColor: Colors.white,
    title: Text(title, style: const TextStyle(color: AppColors.greyColor)),
    centerTitle: true,
    backgroundColor: AppColors.whiteColor,
    actions: actions ??
        [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded),
            onPressed: () {
              customNavigate(context, path: '/FavoritesView');
            },
          ),
        ],
    bottom: tabBar,
  );
}

// actions: []