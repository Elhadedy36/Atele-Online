import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/appointments/data/appointments_model.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reserve_state.dart';

class ReserveCubit extends Cubit<ReserveState> {
  ReserveCubit() : super(ReserveInitial());

TextEditingController timeController=TextEditingController();
TextEditingController dateController=TextEditingController();
GlobalKey<FormState> dateFormKey=GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
Future<void> getCheckOutData()async
{

  try {
  emit(ReserveLoading());
   await _firestore.collection(FirebaseStrings.products).get().then((snapshot) {
    List<ProductModel> products = snapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data());
    }).toList();
    emit(ReserveProductLoaded(product: products));
  });
} on Exception catch (e) {
  emit(ReserveError(message: e.toString()));
}
}
}