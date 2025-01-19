import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'reserve_state.dart';

class ReserveCubit extends Cubit<ReserveState> {
  ReserveCubit() : super(ReserveInitial());

  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> dateFormKey = GlobalKey<FormState>();
  final CollectionReference _firestoreappointment =
      FirebaseFirestore.instance.collection(FirebaseStrings.appointments);
  final CollectionReference _firestoreProduct =
      FirebaseFirestore.instance.collection(FirebaseStrings.products);

  final CollectionReference _firestoreSubUser = FirebaseFirestore.instance
      .collection(FirebaseStrings.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebaseStrings.appointments);

  final CollectionReference _firestoreSubSeller =
      FirebaseFirestore.instance.collection(FirebaseStrings.sellers);

  Future<void> addAppointment(
      ProductModel product, String date, String time) async {
    try {
      Map<String, dynamic> appointmentsData = {
        FirebaseStrings.productName: product.productName,
        FirebaseStrings.categoryName: product.categoryName,
        FirebaseStrings.ateleName: product.ateleName,
        FirebaseStrings.phoneNumber: product.phoneNumber,
        FirebaseStrings.address: product.address,
        FirebaseStrings.appointmentDate: date,
        FirebaseStrings.appointmentTime: time,
        FirebaseStrings.depositeAmount: product.depositeAmount,
        FirebaseStrings.price: product.price,
        FirebaseStrings.rest: product.price - product.depositeAmount,
        FirebaseStrings.productsImages: product.productImages,
        FirebaseStrings.isForRent: product.isForRent,
        FirebaseStrings.productId: product.productId,
        FirebaseStrings.userId: FirebaseAuth.instance.currentUser!.uid,
        FirebaseStrings.status: FirebaseStrings.statusPending,
        FirebaseStrings.sellerId: product.sellerId,
        FirebaseStrings.appointmentId: '',
      };
      // First, create the document in the global appointments collection
      DocumentReference docRef1 =
          await _firestoreappointment.add(appointmentsData);

      String appointmentId = docRef1.id;

      await docRef1.update({
        FirebaseStrings.appointmentId: appointmentId,
      });

      await _firestoreSubUser.doc(appointmentId).set(appointmentsData);

      await _firestoreSubUser.doc(appointmentId).update({
        FirebaseStrings.appointmentId: appointmentId,
      });

      // final productData = await getProductById(product.productId);

      await _firestoreSubSeller
          .doc(product.sellerId)
          .collection(FirebaseStrings.appointments)
          .doc(appointmentId)
          .set(appointmentsData);
          
      await _firestoreSubSeller
          .doc(product.sellerId)
          .collection(FirebaseStrings.appointments)
          .doc(appointmentId)
          .update({
        FirebaseStrings.appointmentId: appointmentId,
      });

      await updateStock(product);
    } catch (e) {
      print('Error adding appointment: $e');
    }
  }

  Future<void> updateStock(ProductModel product) async {
    try {
      await _firestoreProduct.doc(product.productId).update({
        FirebaseStrings.stock: product.stock - 1,
      });
    } catch (e) {
      print('Error updating stock: $e');
    }
  }

  // Future<Map<String, dynamic>?> getProductById(String productId) async {
  //   try {
  //     DocumentSnapshot productSnapshot =
  //         await _firestoreProduct.doc(productId).get();
  //     return productSnapshot.data() as Map<String, dynamic>;
  //   } catch (e) {
  //     print('Error getting product by ID: $e');
  //     return null;
  //   }
  // }
}
