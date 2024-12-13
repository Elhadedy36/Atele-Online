import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/feature/categories/presentation/widgets/category_item.dart';

class CategoryItemBuilder extends StatelessWidget {
  const CategoryItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categmodel.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          categmodel: categmodel[index],
          onTap: () {
            // Use Cubit to set selected category
            context.read<SharedDataCubit>().setCategory(categmodel[index]);
            // Use customNavigate to navigate to StoreView
            customNavigate(context, path: '/StoreView');
          },
        );
      },
    );
  }
}
