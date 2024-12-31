import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/core/utils/app_text_style.dart';
import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categmodel,
    this.onTap,
  });
  final void Function()? onTap;
  final CategoryModel categmodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 180.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: 2),
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.9,
            image: AssetImage(categmodel.categoryImage),
          ),
        ),
        child: Text(categmodel.categoryName,
            style: CustomTextStyles.pacifico300style34),
      ),
    );
  }
}
