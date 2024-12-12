import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/appointments/data/appointments_model.dart';
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



CollectionReference userAppointment = FirebaseFirestore.instance.collection(FirebaseStrings.users);
addUserAppointments(AppointmentsModel model)async
{
 try {
  emit(ReserveLoading());
  await userAppointment.doc(FirebaseAuth.instance.currentUser!.uid).collection(FirebaseStrings.appointments).doc(FirebaseAuth.instance.currentUser!.uid).set
  (
   {
     FirebaseStrings.appointmentId:model.appointmentsId,
     FirebaseStrings.appointmentDate:model.appointmentsDateTime,
     FirebaseStrings.productName:model.productName,
     FirebaseStrings.sellerId:model.sellerId,
     FirebaseStrings.ateleName:model.ateleName,
     FirebaseStrings.depositPaid:model.depositePaid,
     FirebaseStrings.address:model.address,
     FirebaseStrings.phoneNumber:model.phoneNumber,
     FirebaseStrings.userId:model.userId,
   }
  );
  await addApointments(model);
  emit(ReserveSuccess());
} on Exception catch (e) {
  emit(ReserveError(message: e.toString()));
}
}

CollectionReference appointments = FirebaseFirestore.instance.collection(FirebaseStrings.appointments);
addApointments(AppointmentsModel model)async
{
  appointments.doc(FirebaseAuth.instance.currentUser!.uid).set(
    {
      
     FirebaseStrings.appointmentId:model.appointmentsId,
     FirebaseStrings.appointmentDate:model.appointmentsDateTime,
     FirebaseStrings.productName:model.productName,
     FirebaseStrings.sellerId:model.sellerId,
     FirebaseStrings.ateleName:model.ateleName,
     FirebaseStrings.depositPaid:model.depositePaid,
     FirebaseStrings.address:model.address,
     FirebaseStrings.phoneNumber:model.phoneNumber,
     FirebaseStrings.userId:model.userId,
    }
    );

}


}
