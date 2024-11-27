import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/feature/categories/presentation/views/categories_view.dart';
import 'package:atele_online/feature/home/presentation/views/home_view.dart';
import 'package:atele_online/feature/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.secondaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
  
    const HomeView(),
    const CategoriesView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: AppColors.greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.now_widgets_rounded),
      title: ("Categories"),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: AppColors.greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("Profile"),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: AppColors.greyColor,
    ),
  ];
}
