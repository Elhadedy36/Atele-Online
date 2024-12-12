
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 8,
            color: Colors.grey[300],
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 243, 243, 123),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      product.images.isNotEmpty
                          ? product.images
                          : ''),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
          Text(
            "\$${product.depositeAmount}",
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          Text(
            product.productName,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
