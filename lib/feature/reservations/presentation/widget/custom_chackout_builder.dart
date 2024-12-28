import 'package:atele_online/core/Services/service_payment.dart';
import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
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

class CustomCheckOutCardWidget extends StatelessWidget {
  const CustomCheckOutCardWidget({
    super.key, required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedDataCubit, Map<String, dynamic>>(
      builder: (context, state) {
        final date = state["appointmentDate"];
        final time = state["appointmentTime"];
        return BlocBuilder<ReserveCubit, ReserveState>(
          builder: (context, state) {
            return Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      'Checkout',
                      style: CustomTextStyles.pacifico300style34.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
    
                  // Product Image
                  Center(
                    child: Container(
                      height: 160.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(product.productImages.isNotEmpty
                              ? product.productImages
                              : 'https://via.placeholder.com/300'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
    
                  // Product Information Rows
                  _buildCustomRow('Type:', product.isForRent ? 'Rent' : 'Sale', Colors.orange),
                  _buildCustomRow('Product Name:', product.productName, Colors.black),
                  _buildCustomRow('Category:', product.categoryName, Colors.black),
                  _buildCustomRow('Atele Name:', product.ateleName, Colors.black),
                  _buildCustomRow('Phone:', product.phoneNumber, Colors.black),
                  _buildCustomRow('Address:', product.address, Colors.black),
                  SizedBox(height: 16.h),
    
                  // Appointment Details
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Divider(color: Colors.black.withOpacity(0.1), thickness: 0.8.h),
                  ),
                  SizedBox(height: 10.h),
                  _buildCustomRow('Your Appointment:', '${date}, ${time}', Colors.pink),
                  Divider(color: Colors.grey[400], thickness: 0.5.h),
    
                  // Payment Details
                  _buildCustomRow('Deposit Amount:', product.depositeAmount.toString(), Colors.pink),
                  Divider(color: Colors.grey[400], thickness: 0.5.h),
                  _buildCustomRow('Price:', product.price.round().toString(), Colors.pink),
                  Divider(color: Colors.grey[400], thickness: 0.5.h),
                  _buildCustomRow('Rest:', '${product.price - product.depositeAmount}', Colors.pink),
    
                  // Buy Button
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: CustomBtn(
                      text: 'Buy ${product.depositeAmount} \$',
                      textcolor: Colors.white,
                      onPressed: () async {
                        try {
                          await PaymentManager.MakePayment(product.depositeAmount.round(), 'USD');
                          
                          context.read<ReserveCubit>().addAppointment(product, date, time);
                          customNavigate(context, path: '/HoomNavBar');
    
                        } catch (e) {
                          showToast('Payment not completed successfully');
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20.h), 
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Helper method to build custom rows
  Widget _buildCustomRow(String title, String trailingText, Color titleColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomRow(
        title: title,
        trallingText: trailingText,
        style1: CustomTextStyles.poppins400style20.copyWith(
          fontSize: 12.sp,
          color: titleColor,
        ),
        style2: CustomTextStyles.poppins400style20.copyWith(
          fontSize: 12.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
