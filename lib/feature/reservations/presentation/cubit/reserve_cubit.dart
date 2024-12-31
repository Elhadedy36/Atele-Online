import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/appointments/data/appointments_model.dart';
import 'package:atele_online/core/database/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
  final CollectionReference _firestoresub = FirebaseFirestore.instance
      .collection(FirebaseStrings.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebaseStrings.appointments);

  Future<void> addAppointment(
      ProductModel product, String date, String time) async {
    try {
      // First, create the document in the global appointments collection
      DocumentReference docRef = await _firestoreappointment.add({
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
      });

      String appointmentId = docRef.id;

      await docRef.update({
        FirebaseStrings.appointmentId: appointmentId,
      });

      await _firestoresub.doc(appointmentId).set({
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
}
