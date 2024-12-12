import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppoinmentsItem extends StatelessWidget {
  const MyAppoinmentsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Container(
                height: 200.h,
                width: 180.w,
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
                title: FirebaseStrings.depositPaid,
                trallingText: FirebaseStrings.depositeAmount,
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
            SizedBox(height: 20.h),
          ],
        ));
  }
}
