import 'dart:ffi';
import 'package:atele_online/core/database/cache/cache_helper.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:atele_online/core/database/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharedDataCubit extends Cubit<Map<String, dynamic>> {
  SharedDataCubit() : super({"isLoadingFavorites": true}) {
    _initializeFavorites();
  }

  Future<void> _initializeFavorites() async {
    emit({...state, "isLoadingFavorites": true});
    await loadFavoriteProducts();
    emit({...state, "isLoadingFavorites": false});
  }

  // Set selected category
  void setCategory(CategoryModel category) {
    emit({...state, "selectedCategory": category});
  }

  // Set selected product
  void setProduct(ProductModel product) {
    emit({...state, "selectedProduct": product});
  }

  void allProducts(List<ProductModel> products) {
    emit({...state, "allProducts": products});
  }

  // Set appointment time
  void setAppointmentTime(String time, String date) {
    final timeParts = time.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1].split(' ')[0]);
    final period = timeParts[1].split(' ')[1];

    final adjustedHour = period.toLowerCase() == 'pm' && hour != 12
        ? hour + 12
        : (period.toLowerCase() == 'am' && hour == 12 ? 0 : hour);

    final formattedTime =
        '${adjustedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    final dateParts = date.split('-');
    final year = dateParts[0];
    final month = dateParts[1].padLeft(2, '0');
    final day = dateParts[2].padLeft(2, '0');

    final formattedDate = '$year-$month-$day';

    emit({
      ...state,
      "appointmentTime": formattedTime,
      "appointmentDate": formattedDate,
    });
  }

  // Clear all data from the state
  void clearData() {
    emit({});
  }

  // Get the current data from the state
  Map<String, dynamic> getData() => state;

  // Method to add a product to the favorites list using CacheHelper
  // Load favorite products data from Firebase
  Future<void> loadFavoriteProducts() async {
    try {
      // Load favorite product IDs from SharedPreferences
      final favoriteIds = await _getFavoritesList();

      // Fetch products from Firebase based on the IDs
      final firestore = FirebaseFirestore.instance;
      List<ProductModel> favoriteProducts = [];

      for (String id in favoriteIds) {
        final doc =
            await firestore.collection(FirebaseStrings.products).doc(id).get();
        if (doc.exists) {
          favoriteProducts.add(ProductModel.fromJson(doc.data()!));
        }
      }

      // Update the state with the favorite products
      emit({
        ...state,
        "favoriteProducts": favoriteProducts,
        "favorites": favoriteIds, // Keep IDs for easy lookup
      });
    } catch (e) {
      print('Error loading favorite products: $e');
    }
  }

  // Helper method to get the favorites list from CacheHelper
  Future<List<String>> _getFavoritesList() async {
    final favorites = CacheHelper().getList(key: 'favoritesKey');
    return favorites ?? [];
  }

  // Add a product to favorites
  Future<void> addToFavorites(String productId) async {
    await CacheHelper().addToList(key: 'favoritesKey', value: productId);
    await loadFavoriteProducts(); // Reload favorites after modification
  }

  // Remove a product from favorites
  Future<void> removeFromFavorites(String productId) async {
    await CacheHelper().removeFromList(key: 'favoritesKey', value: productId);
    await loadFavoriteProducts(); // Reload favorites after modification
  }
}
