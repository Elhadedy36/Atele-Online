import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:atele_online/feature/store/presentation/cubit/cubit/products_cubit.dart';
import 'package:atele_online/feature/store/presentation/widgets/product_item_grid_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StoreView extends StatelessWidget {
  const StoreView({
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

        return CustomScrollView(
          slivers: [
           SliverSizedBox(24.h),
            SliverToBoxAdapter(
              child: ProductItemGridBuilder(products: products),
            ),
          ],
        );
      },
    );
  }
}
