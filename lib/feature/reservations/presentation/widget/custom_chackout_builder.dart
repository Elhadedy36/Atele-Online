import 'package:atele_online/core/Services/service_payment.dart';
import 'package:atele_online/core/functions/custom_toast.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/utils/app_text_style.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/core/widgets/custom_row.dart';
import 'package:atele_online/feature/reservations/presentation/cubit/reserve_cubit.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChackOutCardWidget extends StatelessWidget {
  const CustomChackOutCardWidget({
    super.key, required this.product,
  });
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveCubit, ReserveState>(
      builder: (context, state) {

       if (state is ReserveLoading)
       {
        return CircularProgressIndicator();
       }
       if(state is ReserveError)
       {
        showToast(state.message);
       }
        
        if (state is ReserveProductLoaded){
          final product=state.product[0];
       return  Card(
            color: Colors.white70,
            margin: EdgeInsets.symmetric(horizontal: 36.w, vertical: 16.h),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Text('Chackout',
                    style: CustomTextStyles.pacifico300style34
                        .copyWith(fontSize: 18.sp)),
                SizedBox(height: 8.h),
                Container(
                    height: 160.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image:  DecorationImage(
                          image: NetworkImage(product.productImages),
                          fit: BoxFit.cover,
                        ))),
                SizedBox(height: 26.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomRow(
                      title: product.isForRent?'Rent':'Sale',
                      trallingText: '',
                      style1: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 14.sp, color: Colors.orange),
                      style2: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomRow(
                      title: 'Name Drees:',
                      trallingText: product.productName,
                      style1: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp),
                      style2: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomRow(
                      title: 'Category Name:',
                      trallingText: product.categoryName,
                      style1: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp),
                      style2: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomRow(
                      title: 'Name Atele:',
                      trallingText: product.ateleName,
                      style1: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp),
                      style2: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomRow(
                      title: 'Phone :',
                      trallingText: product.phoneNumber, 
                      style1: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp),
                      style2: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomRow(
                      title: 'Address :',
                      trallingText: product.address,
                      style1: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp),
                      style2: CustomTextStyles.poppins400style20
                          .copyWith(fontSize: 12.sp)),
                ),
                SizedBox(height: 4.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Divider(color: Colors.black45, thickness: 0.9.h)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: CustomRow(
                        title: 'Your Appointment :',
                        trallingText: '3:30 - 20-12-2024',
                        style1: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 11.sp, color: Colors.pink),
                        style2: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 12.sp, color: Colors.pink))),
                Divider(color: Colors.grey[400], thickness: 0.5.h),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    child: CustomRow(
                        title: FirebaseStrings.depositeAmount,
                        trallingText:product.depositeAmount.round().toString(),
                        style1: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 12.sp, color: Colors.pink),
                        style2: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 12.sp, color: Colors.pink))),
                Divider(color: Colors.grey[400], thickness: 0.5.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: CustomRow(
                        title: FirebaseStrings.price,
                        trallingText: product.price.round().toString(),
                        style1: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 11.sp, color: Colors.pink),
                        style2: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 12.sp, color: Colors.pink))),
                Divider(color: Colors.grey[400], thickness: 0.5.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: CustomRow(
                        title: 'Rest :',
                        trallingText: '${product.price - product.depositeAmount}',
                        style1: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 11.sp, color: Colors.pink),
                        style2: CustomTextStyles.poppins400style20
                            .copyWith(fontSize: 12.sp, color: Colors.pink))),
                Divider(color: Colors.grey[400], thickness: 0.5.h),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomBtn(
                    text: 'Buy ${product.depositeAmount.round()} \$',
                    textcolor: Colors.white,
                    onPressed: () async {
                      try {
                        await PaymentManager.MakePayment(product.depositeAmount.round(), 'USD');
                        customNavigate(context, path: '/HoomNavBar');
                      } on Exception catch (e) {
                        showToast('not completed successfully');
                      }
                    },
                  ),
                ),
              ],
            ));
            }
            return Container();
          
            
    },
    );
  }

}