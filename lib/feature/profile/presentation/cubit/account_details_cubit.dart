import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/profile/data/model/account_details_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'account_details_state.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  AccountDetailsCubit() : super(AccountDetailsInitial());
  CollectionReference users =
      FirebaseFirestore.instance.collection(FirebaseStrings.users);

  Future<void> getUserDetails() async {
    emit(AccountDetailsLoading());
    try {
      final docSnapshot = await users.doc(FirebaseAuth.instance.currentUser!.uid).get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        final accountDetailsModel =
            AccountDetailsModel.fromJson(docSnapshot.data()!);

        emit(AccountDetailsLoaded(accountDetailsModel: accountDetailsModel));
      } else {
        emit(AccountDetailsError(message: 'User not found.'));
      }
    } catch (error) {
      emit(AccountDetailsError(message: error.toString()));
    }
  }

  void signOut() async {
    try {
      emit(SignOutLoadingState());
      await FirebaseAuth.instance.signOut();

      emit(SignOutSuccessState());
    } catch (e) {
      emit(SignOutErrorState(e.toString()));
    }
  }

  // Future<void> getUserDetails() async {
  //   emit(AccountDetailsLoading());
  //   await users.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value, dynamic UserModel ) {
  //     emit(AccountDetailsLoaded(userModel: UserModel.fromJson(value.data()!)));
  //   });
  // }
}
