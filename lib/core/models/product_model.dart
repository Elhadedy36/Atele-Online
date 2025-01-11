import 'package:atele_online/core/utils/app_strings.dart';

class ProductModel {
  final String productId;
  final String ateleName;
  final String productName;
  final String productDescription;
  final String categoryName;
  final String sellerId;
  final bool isForRent;
  final double depositeAmount;
  final List<String> productImages; // Changed to List<String>
  final String address;
  final double price;
  final String phoneNumber;
  final int stock;
  final int viewsCount;
  ProductModel({
    required this.productId,
    required this.ateleName,
    required this.productName,
    required this.productDescription,
    required this.categoryName,
    required this.sellerId,
    required this.isForRent,
    required this.depositeAmount,
    required this.productImages, // Updated parameter type
    required this.address,
    required this.price,
    required this.phoneNumber,
    required this.stock,
    required this.viewsCount,
  });

  // Factory constructor to create a ProductModel from a JSON map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Ensure that productImages is a List<String>, provide an empty list if null
    final List<String> images =
        (json[FirebaseStrings.productsImages] as List?)?.cast<String>() ??
            <String>[];

    return ProductModel(
      productId: json[FirebaseStrings.productId],
      ateleName: json[FirebaseStrings.ateleName],
      productName: json[FirebaseStrings.productName],
      productDescription: json[FirebaseStrings.productDescription],
      categoryName: json[FirebaseStrings.categoryName],
      sellerId: json[FirebaseStrings.sellerId],
      isForRent: json[FirebaseStrings.isForRent],
      depositeAmount: json[FirebaseStrings.depositeAmount],
      productImages: images, // Assign the list of images
      address: json[FirebaseStrings.address],
      price: json[FirebaseStrings.price],
      phoneNumber: json[FirebaseStrings.phoneNumber],
      stock: json[FirebaseStrings.stock],
      viewsCount: json[FirebaseStrings.viewsCount],
    );
  }
}
