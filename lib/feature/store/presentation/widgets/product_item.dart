import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Constrain Card width within the screen size
        final maxWidth = constraints.maxWidth;

        return GestureDetector(
          onTap: () {
            context.read<SharedDataCubit>().setProduct(product);
            customNavigate(context, path: '/itemView');
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth, // Card will respect its parent's constraints
            ),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Product Image with Gradient Overlay
                  Stack(
                    children: [
                      // Image Container
                      Container(
                        height: 180.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              product.productImages.isNotEmpty
                                  ? product.productImages
                                  : 'https://via.placeholder.com/300',
                            ),
                          ),
                        ),
                      ),
                      // Gradient Overlay
                      Container(
                        height: 180.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      // Product Name Overlay
                      Positioned(
                        bottom: 8.h,
                        left: 8.w,
                        right: 8.w,
                        child: Text(
                          product.productName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.6),
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  // Product Details
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Product Description
                        Text(
                          product.productDescription,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6.h),
                        // Price and Action Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Product Price
                            Flexible(
                              child: Text(
                                "\$${product.depositeAmount}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8.w), // Space between price and button
                            // View Button
                            ElevatedButton(
                              onPressed: () {
                                context.read<SharedDataCubit>().setProduct(product);
                                customNavigate(context, path: '/itemView');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              ),
                              child: Text(
                                'View',
                                style: TextStyle(fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
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
