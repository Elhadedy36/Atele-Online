import 'package:flutter/material.dart';
import 'product_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 3 / 4,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(
          productName: product['name'] ?? '',
          productPrice: product['price'] ?? 0.0,
          offerText: product['offer'] ?? '',
        );
      },
    );
  }
}
