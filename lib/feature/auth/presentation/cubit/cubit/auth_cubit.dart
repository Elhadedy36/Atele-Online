import 'package:bloc/bloc.dart';
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
    } on FirebaseAuthException catch (e) {
      emit(SignUpError(e.code));
    }
  }

  SignOut() async {
    try {
      emit(SignOutLoading());
      await FirebaseAuth.instance.signOut();
      emit(SignOutSuccess());
    } on Exception catch (e) {
      emit(SignOutError( e.toString()));
    }
  }

}
