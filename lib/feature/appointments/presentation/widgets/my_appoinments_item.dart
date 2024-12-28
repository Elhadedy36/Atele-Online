import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_row.dart';
import 'package:atele_online/feature/appointments/data/appointments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppoinmentsItem extends StatelessWidget {
  const MyAppoinmentsItem({
    super.key, required this.model,
  });
final AppointmentsModel model;
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
                  image:  DecorationImage(
                    image: NetworkImage(model.productImg),
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
                trallingText: model.depositeAmount.toString(),
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
                trallingText: model.ateleName,
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
                trallingText: model.phoneNumber,
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
                trallingText:model.address,
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
                trallingText: '${model.appointmentsDate} at ${model.appointmentsTime}',
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
