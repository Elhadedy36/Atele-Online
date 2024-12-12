import 'package:atele_online/core/Services/service_payment.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/utils/app_text_style.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/core/widgets/custom_row.dart';
import 'package:atele_online/feature/reservations/presentation/cubit/reserve_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChackOutCardBuilder extends StatelessWidget {
  const CustomChackOutCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Define the data for the rows
    final List<Map<String, String>> rowData = [
      {'title': 'Rent', 'trailingText': '', 'color': 'orange'},
      {'title': 'Drees Name:', 'trailingText': 'dress3'},
      {'title': 'Category Name:', 'trailingText': 'Evening Drees'},
      {'title': 'Atele Name:', 'trailingText': 'Atele Online'},
      {'title': 'Phone:', 'trailingText': '01092939601'},
      {'title': 'Address :', 'trailingText': 'دمياط دمياط  '},
      {
        'title': 'Your Appointment :',
        'trailingText': '3:30 - 20-12-2024',
        'color': 'pink'
      },
      {'title': 'Price :', 'trailingText': '\$2000', 'color': 'pink'},
      {'title': 'Deposit :', 'trailingText': '\$500', 'color': 'pink'},
      {'title': 'Rest :', 'trailingText': '\$1500', 'color': 'pink'},
    ];

    return BlocConsumer<ReserveCubit, ReserveState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Card(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 6,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Chackout',
                    style: CustomTextStyles.pacifico300style34.copyWith(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 160.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(Assets.imagesDrees),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  ...rowData.map((row) {
                    final color = row['color'] == 'orange'
                        ? Colors.orange
                        : row['color'] == 'pink'
                            ? Colors.pink
                            : Colors.black;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          CustomRow(
                            title: row['title']!,
                            trallingText: row['trailingText']!,
                            style1: CustomTextStyles.poppins400style20.copyWith(
                              fontSize: 12.sp,
                              color: color,
                            ),
                            style2: CustomTextStyles.poppins400style20
                                .copyWith(fontSize: 10.sp),
                          ),
                          if (row['title'] == 'Address :' ||
                              row['color'] == 'pink')
                            Divider(color: Colors.grey[400], thickness: 0.5.h),
                        ],
                      ),
                    );
                  }).toList(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomBtn(
                      text: 'Buy \$500',
                      textcolor: Colors.white,
                      onPressed: () async {
                        
                        await PaymentManager.MakePayment(500, 'USD');
                        customNavigate(context, path: '/ChackoutView');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
