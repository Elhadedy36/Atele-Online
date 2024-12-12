import 'package:atele_online/core/utils/app_assets.dart';
import 'package:atele_online/core/utils/app_strings.dart';

class CategoryModel {
  
  final String categoryName;
  final String categoryDescription;
  final String categoryImage;
  CategoryModel(
      {
      required this.categoryName,
      required this.categoryImage,
      required this.categoryDescription});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      categoryName: json[FirebaseStrings.categoryName],
      categoryImage: json[FirebaseStrings.categoryImage],
      categoryDescription: json[FirebaseStrings.categoryDescription]);
}

List<CategoryModel> categmodel = [
  CategoryModel(
      
      categoryName: AppStrings.weddingDress,
      categoryImage: Assets.imagesDrees4,
      categoryDescription: 'categoryDescription'),
  CategoryModel(
      
      categoryName: AppStrings.eveningDress,
      categoryImage: Assets.imagesDrees5,
      categoryDescription: 'categoryDescription'),
];