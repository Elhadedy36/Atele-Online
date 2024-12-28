import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/appointments/data/appointments_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitial());
  final _firestore = FirebaseFirestore.instance;
 List<AppointmentsModel> appointmentsList=[];

  getAppointmentsData() async
  {
   

    try {
       emit(GetAppointmentsDataLoading());
  await _firestore.collection(FirebaseStrings.users).doc(FirebaseAuth.instance.currentUser!.uid).collection(FirebaseStrings.appointments).get().then((snapshot) {
    
     appointmentsList = snapshot.docs.map((doc) {
      return AppointmentsModel.fromJson(doc.data());
    }).toList();

  
  });
      emit(GetAppointmentsDataSuccess(appointmentsModel: appointmentsList));

} on Exception catch (e) {
 
  emit(GetAppointmentsDataError(message: e.toString()));
}

  }

}
