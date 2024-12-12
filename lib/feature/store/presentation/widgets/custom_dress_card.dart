import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/feature/store/data/model/item_detalis.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:atele_online/feature/store/presentation/cubit/cubit/products_cubit.dart';
import 'package:atele_online/feature/store/presentation/views/items_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomDressCard extends StatelessWidget {
  const CustomDressCard({
    super.key,
    required this.categoryName,
    required this.isForRent,
  }); 

  final String categoryName;
  final bool isForRent;

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<ProductModel>>(
      stream: context.read<ProductsCubit>().getProductStream(categoryName, isForRent),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No products available"));
        }

        final products = snapshot.data!;

        return Column(
          children: [
            Container(height: 16.h),
            SizedBox(
              height: 555.h,
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 350,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
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
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
