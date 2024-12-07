import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_list_title.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_row_chackout.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChackoutView extends StatelessWidget {
  const ChackoutView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Chackout', actions: []),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CustomSliderThem(
                  indexTop: 1,
                ),
              ),
              const SliverToBoxAdapter(
                child: CustomListTitle(
                  image: AssetImage(Assets.imagesDrees),
                  title: 'Red Dress ',
                  subtitle: 'Evening Dress',
                  trallingText: '\$2000',
                ),
              ),
              SliverSizedBox(8.h),
              SliverToBoxAdapter(
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 2.h,
                ),
              ),
              SliverSizedBox(20.h),
              const SliverToBoxAdapter(
                child: CustomRowChackOut(
                    title: FirebaseStrings.depositPaid,
                    trallingText: FirebaseStrings.price),
              ),
              SliverSizedBox(8.h),
              const SliverToBoxAdapter(
                  child: CustomRowChackOut(
                      title: FirebaseStrings.address,
                      trallingText: 'New Damietta')),
              SliverSizedBox(8.h),
              const SliverToBoxAdapter(
                  child: CustomRowChackOut(
                      title: 'Time&Date', trallingText: '3:30-20-12-2024')),
              SliverSizedBox(180.h),
              SliverToBoxAdapter(
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 2.h,
                ),
              ),
              SliverSizedBox(16.h),
              const SliverToBoxAdapter(
                  child: CustomRowChackOut(
                      title: AppStrings.totel, trallingText: '\$3000')),
              SliverSizedBox(16.h),
              SliverToBoxAdapter(
                child: CustomBtn(
                  text: AppStrings.buyNow,
                  textcolor: Colors.white,
                  onPressed: () {
                    customNavigate(context, path: '/ChackoutView');
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
