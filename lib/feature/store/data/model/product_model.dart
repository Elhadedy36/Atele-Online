import 'package:atele_online/core/utils/app_strings.dart';

class ProductModel 
{
final String ateleName;
final String productName;
final String productDescription;
final String categoryName;
final String sellerId;
final bool isForRent;
final double depositeAmount;
final String productImages;
final String address;
final double price;
final String phoneNumber;


  ProductModel( {required this.ateleName, required this.productName, required this.productDescription, required this.categoryName, required this.sellerId,  required this.isForRent, required this.depositeAmount, required this.productImages,required this.address,required this.price,required this.phoneNumber});


factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    
    ateleName:   json[FirebaseStrings.ateleName],
    productName: json[FirebaseStrings.productName],
    productDescription: json[FirebaseStrings.productDescription],
    categoryName: json[FirebaseStrings.categoryName],
    sellerId: json[FirebaseStrings.sellerId],
    isForRent: json[FirebaseStrings.isForRent],
    depositeAmount: json[FirebaseStrings.depositeAmount],
    productImages: json[FirebaseStrings.productsImages],
    address:     json[FirebaseStrings.address],
    price:       json[FirebaseStrings.price],
    phoneNumber: json[FirebaseStrings.phoneNumber],
  );
  }
}