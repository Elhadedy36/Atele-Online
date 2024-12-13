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
    return GestureDetector(
      onTap: () {
        // Use Cubit to set selected product
        context.read<SharedDataCubit>().setProduct(product);
        // Navigate to ItemDetailsView using customNavigateReplacement
        customNavigate(context, path: '/itemView');
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
                    product.productImages.isNotEmpty ? product.productImages : '',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.productDescription,
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
