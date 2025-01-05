import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/appointments/presentation/cubit/appointments_cubit.dart';
import 'package:atele_online/feature/appointments/presentation/views/my_appointments_view.dart';
import 'package:atele_online/feature/categories/presentation/views/categories_view.dart';
import 'package:atele_online/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      backgroundColor: AppColors.whiteColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(),
      ),
    );
  }


  void jumpToTab(int index) {
  _controller.jumpToTab(index); 
}
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const CategoriesView(),
    BlocProvider(
      create: (context) => AppointmentsCubit()..getAppointmentsData(),
      child: const MyAppointmentsView(),
    ),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: (AppStrings.home),
      activeColorPrimary: AppColors.blackColor,
      inactiveColorPrimary: AppColors.greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.now_widgets_rounded),
      title: (AppStrings.categories),
      activeColorPrimary: AppColors.blackColor,
      inactiveColorPrimary: AppColors.greyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.punch_clock),
      title: (AppStrings.profile),
      activeColorPrimary: AppColors.blackColor,
      inactiveColorPrimary: AppColors.greyColor,
    ),
  ];
}
