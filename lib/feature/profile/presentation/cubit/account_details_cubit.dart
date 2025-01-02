import 'package:atele_online/core/database/cache/cache_helper.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/profile/data/model/account_details_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'account_details_state.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  AccountDetailsCubit() : super(AccountDetailsInitial());
  CollectionReference users =
      FirebaseFirestore.instance.collection(FirebaseStrings.users);
  TextEditingController nameControllerEdit = TextEditingController();
  TextEditingController phoneControllerEdit = TextEditingController();
  TextEditingController cityControllerEdit = TextEditingController();
  TextEditingController emailControllerEdit = TextEditingController();

  Future<void> getUserDetails() async {
    emit(AccountDetailsLoading());
    try {
      // Check if data exists in Cache
      final cachedName = CacheHelper().getData(key: 'userNameKey');
      final cachedEmail = CacheHelper().getData(key: 'userEmailKey');
      final cachedPhone = CacheHelper().getData(key: 'userPhoneKey');
      final cachedLocation = CacheHelper().getData(key: 'userLocationKey');
      final cachedLastName = CacheHelper().getData(key: 'userLastNameKey');

      if (cachedName != null &&
          cachedEmail != null &&
          cachedPhone != null &&
          cachedLocation != null &&
          cachedLastName != null) {
        // Load data from cache
        emit(AccountDetailsLoaded(
          accountDetailsModel: AccountDetailsModel(
            fristname: cachedName,
            email: cachedEmail,
            lastname: cachedLastName,
            phone: cachedPhone,
            location: cachedLocation,
          ),
        ));
      } else {
        // Fetch from Firebase
        final docSnapshot =
            await users.doc(FirebaseAuth.instance.currentUser!.uid).get();
        if (docSnapshot.exists && docSnapshot.data() != null) {
          final accountDetailsModel =
              AccountDetailsModel.fromJson(docSnapshot.data()!);

          // Save to cache
          await CacheHelper().saveData(
              key: 'userNameKey', value: accountDetailsModel.fristname);
          await CacheHelper()
              .saveData(key: 'userEmailKey', value: accountDetailsModel.email);
          await CacheHelper()
              .saveData(key: 'userPhoneKey', value: accountDetailsModel.phone);
          await CacheHelper().saveData(
              key: 'userLocationKey', value: accountDetailsModel.location);
          await CacheHelper().saveData(
              key: 'userLastNameKey', value: accountDetailsModel.lastname);

          // Emit loaded state
          emit(AccountDetailsLoaded(accountDetailsModel: accountDetailsModel));
        } else {
          emit(AccountDetailsError(message: 'User not found.'));
        }
      }
    } catch (error) {
      emit(AccountDetailsError(message: error.toString()));
    }
  }

  editAccountDetails() async {
    await users.doc(FirebaseAuth.instance.currentUser!.uid).update({
      FirebaseStrings.fristname: nameControllerEdit.text,
      FirebaseStrings.phoneNumber: phoneControllerEdit.text,
      FirebaseStrings.location: cityControllerEdit.text,
    });
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
}
