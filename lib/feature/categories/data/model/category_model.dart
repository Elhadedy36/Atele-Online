import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';

class CategoryModel 
{
  final String categoryId;
  final String categoryName;
  final String categoryDescription;
  final String categoryImage;
  CategoryModel({ required this.categoryId,required this.categoryName,required this.categoryImage,required this.categoryDescription});
}

List<CategoryModel> categmodel = 
[
  CategoryModel(categoryId: 'categoryId', categoryName: AppStrings.weddingDress, categoryImage: Assets.imagesDrees4, categoryDescription: 'categoryDescription'),
  CategoryModel(categoryId: 'categoryId', categoryName: AppStrings.weddingDress, categoryImage: Assets.imagesDrees5, categoryDescription: 'categoryDescription'),
  CategoryModel(categoryId: 'categoryId', categoryName: AppStrings.eveningDress, categoryImage: Assets.imagesDrees3, categoryDescription: 'categoryDescription'),
  CategoryModel(categoryId: 'categoryId', categoryName: AppStrings.categories, categoryImage: Assets.imagesDrees2, categoryDescription: 'categoryDescription'),
];