import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/core/widgets/custom_row.dart';
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
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: CustomSliderThem(
              indexTop: 1,
            ),
          ),
          const SliverToBoxAdapter(
            child: ChackoutBuilder(),
          ),
        ]),
      ),
    );
  }
}

class ChackoutBuilder extends StatelessWidget {
  const ChackoutBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return const CustomChackOutCardWidget();
      },
    );
  }
}

class CustomChackOutCardWidget extends StatelessWidget {
  const CustomChackOutCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white70,
        margin: EdgeInsets.symmetric(horizontal: 36.w, vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Chackout',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
                height: 160.h,
                width: 140.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(Assets.imagesDrees),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(height: 26.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Rent',
                trallingText: '',
                style1: TextStyle(
                    color: Colors.orange,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Name Drees:',
                trallingText: 'Drees 1',
                style1: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Category Name:',
                trallingText: 'Evening Drees',
                style1: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Name Atele:',
                trallingText: 'Atele Online',
                style1: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Phone :',
                trallingText: '01092939601',
                style1: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Address :',
                trallingText: 'New Damietta',
                style1: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Divider(
                color: Colors.black45,
                thickness: 0.9.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Your Appointment :',
                trallingText: '3:30 - 20-12-2024',
                style1: TextStyle(
                    color: Colors.pink,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 0.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: FirebaseStrings.price,
                trallingText: '\$2000',
                style1: TextStyle(
                    color: Colors.pink,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 0.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: FirebaseStrings.deposit,
                trallingText: '\$500',
                style1: TextStyle(
                    color: Colors.pink,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 0.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomRow(
                title: 'Rest :',
                trallingText: '\$1500',
                style1: TextStyle(
                    color: Colors.pink,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold),
                style2: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 0.5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomBtn(
                text: 'Buy \$500',
                textcolor: Colors.white,
                onPressed: () {
                  customNavigate(context, path: '/ChackoutView');
                },
              ),
            ),
          ],
        ));
  }
}
