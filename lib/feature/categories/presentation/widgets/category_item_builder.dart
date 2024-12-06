import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:atele_online/feature/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
class CategoryItemBuilder extends StatelessWidget {
  const CategoryItemBuilder({
    super.key, required this.path,
  });
  final String path;

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
            customNavigate(context, path: path,extra: categmodel[index]);
          },
        );
      },
    );
  }
}

