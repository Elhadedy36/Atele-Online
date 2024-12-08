part of 'account_details_cubit.dart';

@immutable
sealed class AccountDetailsState {}

final class AccountDetailsInitial extends AccountDetailsState {}
final class AccountDetailsLoading extends AccountDetailsState {}

final class AccountDetailsLoaded extends AccountDetailsState {
  final AccountDetailsModel accountDetailsModel;
  AccountDetailsLoaded({required this.accountDetailsModel});

}
final class AccountDetailsError extends AccountDetailsState {
  final String message;
  AccountDetailsError({required this.message});
}
final class SignOutLoadingState extends AccountDetailsState {}
final class SignOutSuccessState extends AccountDetailsState {}
final class SignOutErrorState extends AccountDetailsState {
  final String message;
  SignOutErrorState(this.message);
}