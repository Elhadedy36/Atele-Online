import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/appointments/data/appointments_model.dart';
import 'package:atele_online/feature/appointments/presentation/cubit/appointments_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentsCubit extends Cubit<void> {
  AppointmentsCubit() : super(AppointmentsInitial());

  final _firestore = FirebaseFirestore.instance;

  Stream<List<AppointmentsModel>> getAppointmentsStream() {
    return _firestore
        .collection(FirebaseStrings.users)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(FirebaseStrings.appointments)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppointmentsModel.fromJson(doc.data());
      }).toList();
    });
  }
}
