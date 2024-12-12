import 'package:atele_online/core/utils/app_strings.dart';

class ProductModel 
{

final String productName;
final String description;
final String categoryName;
final String sellerId;
final bool isForRent;
final double depositeAmount;
final String images;

  ProductModel({ required this.productName, required this.description, required this.categoryName, required this.sellerId,  required this.isForRent, required this.depositeAmount, required this.images});


factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    productName: json[FirebaseStrings.productName],
    description: json[FirebaseStrings.productDescription],
    categoryName: json[FirebaseStrings.categoryName],
    sellerId: json[FirebaseStrings.sellerId],
    isForRent: json[FirebaseStrings.isForRent],
    depositeAmount: json[FirebaseStrings.depositeAmount],
    images: json[FirebaseStrings.productsImages],
  );
  }
}