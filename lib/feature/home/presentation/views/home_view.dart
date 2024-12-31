import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_drawer.dart';
import 'package:atele_online/core/widgets/custom_header_text.dart';
import 'package:atele_online/feature/home/presentation/widgets/custom_animated_typer_text.dart';
import 'package:atele_online/feature/home/presentation/widgets/custom_page_view.home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: const CustomDrawerProfile(),
      appBar: customAppBar(title: AppStrings.home, context: context),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: CustomScrollView(slivers: [
          const SliverToBoxAdapter(
            child: AnimatedTyperText(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(
            child: CustomPageViewHome(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12.h)),
          const SliverToBoxAdapter(
            child: CustomHeaderText(text: AppStrings.offers),
          )
        ]),
      ),
    );
  }
}
