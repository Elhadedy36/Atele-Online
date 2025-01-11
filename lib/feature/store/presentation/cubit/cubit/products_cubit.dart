import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/models/product_model.dart';
import 'package:atele_online/feature/store/presentation/cubit/cubit/products_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Stream<List<ProductModel>> getProductStream(String categoryName, bool isForRent) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return _firestore
        .collection(FirebaseStrings.products)
        .where(FirebaseStrings.categoryName, isEqualTo: categoryName)
        .where(FirebaseStrings.isForRent, isEqualTo: isForRent)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    });
  }

  Future<void> updateViews(String productId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      final String userId = currentUser.uid;

      final DocumentReference productDoc = _firestore.collection(FirebaseStrings.products).doc(productId);
      final DocumentSnapshot productSnapshot = await productDoc.get();

      if (productSnapshot.exists) {
        final Map<String, dynamic> productData = productSnapshot.data() as Map<String, dynamic>;
        final List<dynamic> viewedBy = productData[FirebaseStrings.viewedBy] ?? [];

        if (!viewedBy.contains(userId)) {
          await productDoc.update({
            FirebaseStrings.viewsCount: FieldValue.increment(1),
            FirebaseStrings.viewedBy: FieldValue.arrayUnion([userId]),
          });
        }
      }
    }
  }
}
