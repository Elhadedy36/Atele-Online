import 'package:atele_online/feature/auth/data/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> SignInFormKey = GlobalKey<FormState>();
  TextEditingController email_in = TextEditingController();
  TextEditingController phone_num = TextEditingController();
  TextEditingController password_in = TextEditingController();
  TextEditingController email_up = TextEditingController();
  TextEditingController password_up = TextEditingController();
  TextEditingController fristname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> scrollkey = GlobalKey<FormState>();
  final user = FirebaseFirestore.instance.collection('Users');

  SignInWithEmailAndPassword() async {
    try {
      emit(SignInLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_in.text, password: password_in.text);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignInError(e.code));
    }
  }

  SignUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email_up.text, password: password_up.text);
          emit(SignUpSuccess());

      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      emit(EmailVerificationsuccess());
      bool emailVerified = false;
      while (!emailVerified) {
        await Future.delayed(const Duration(seconds: 5));
        await FirebaseAuth.instance.currentUser!.reload();
        emailVerified = await FirebaseAuth.instance.currentUser!.emailVerified;
        if (emailVerified) {
          addUser(UserModel(
            fristname: fristname.text,
            lastname: lastname.text,
            phone: phone_num.text,
            uId: FirebaseAuth.instance.currentUser!.uid,
            email: email_up.text,
          ));
        }
      }

      
    } on FirebaseAuthException catch (e) {
      emit(SignUpError(e.code));
    }
  }

  addUser(UserModel userModel) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'fristname': userModel.fristname,
      'lastname': userModel.lastname,
      'phone': userModel.phone,
      'uId': userModel.uId,
      'email': userModel.email,
    });
  }

  SignOut() async {
    try {
      emit(SignOutLoading());
      await FirebaseAuth.instance.signOut();
      emit(SignOutSuccess());
    } on Exception catch (e) {
      emit(SignOutError(e.toString()));
    }
  }
}
