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
final CollectionReference _firestore = FirebaseFirestore.instance.collection(FirebaseStrings.appointments);
final CollectionReference _firestoresub = FirebaseFirestore.instance.collection(FirebaseStrings.users).doc(FirebaseAuth.instance.currentUser!.uid).collection(FirebaseStrings.appointments);

addAppointment(ProductModel product,String date,String time)async
{
  await addUserAppointment(product, date, time);
  
 await _firestore.add
  ({
    FirebaseStrings.productName:product.productName,
    FirebaseStrings.categoryName:product.categoryName,
    FirebaseStrings.ateleName:product.ateleName,
    FirebaseStrings.phoneNumber:product.phoneNumber,
    FirebaseStrings.address:product.address,
    FirebaseStrings.appointmentDate:date,
    FirebaseStrings.appointmentTime:time,
    FirebaseStrings.depositeAmount:product.depositeAmount,
    FirebaseStrings.price:product.price,
    FirebaseStrings.rest: product.price-product.depositeAmount,
    FirebaseStrings.productsImages:product.productImages,
    FirebaseStrings.isForRent:product.isForRent,
    FirebaseStrings.userId:FirebaseAuth.instance.currentUser!.uid,
  });


}

addUserAppointment(ProductModel product,String date,String time)async
{
  await _firestoresub.add
  ({
    FirebaseStrings.productName:product.productName,
    FirebaseStrings.categoryName:product.categoryName,
    FirebaseStrings.ateleName:product.ateleName,
    FirebaseStrings.phoneNumber:product.phoneNumber,
    FirebaseStrings.address:product.address,
    FirebaseStrings.appointmentDate:date,
    FirebaseStrings.appointmentTime:time,
    FirebaseStrings.depositeAmount:product.depositeAmount,
    FirebaseStrings.price:product.price,
    FirebaseStrings.rest: product.price-product.depositeAmount,
    FirebaseStrings.productsImages:product.productImages,
    FirebaseStrings.isForRent:product.isForRent,
    FirebaseStrings.userId:FirebaseAuth.instance.currentUser!.uid,
  }); 
}
}