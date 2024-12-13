part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInError extends AuthState {
  final String errmsg;
  SignInError(this.errmsg);
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpError extends AuthState {
  final String errmsg;
  SignUpError(this.errmsg);
}

final class SignOutLoading extends AuthState {}

final class SignOutSuccess extends AuthState {}

final class SignOutError extends AuthState {
  final String errmsg;
  SignOutError(this.errmsg);
}

final class EmailVerificationsuccess extends AuthState {}

final class EmailVerificationError extends AuthState {
  final String errmsg;
  EmailVerificationError(this.errmsg);
}

final class GoolegleSignInLoadingState extends AuthState {}

final class GoogleSignInSuccessState extends AuthState {}

final class GoogleSignInErrorState extends AuthState {
  final String error;
  GoogleSignInErrorState(this.error);
}

final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordFailuerState extends AuthState {
  final String errorMessage;

  ResetPasswordFailuerState({required this.errorMessage});
}
