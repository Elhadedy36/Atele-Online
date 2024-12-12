part of 'reserve_cubit.dart';

@immutable
sealed class ReserveState {}

final class ReserveInitial extends ReserveState {}

class ReserveLoading extends ReserveState {}

class ReserveSuccess extends ReserveState {}

class ReserveError extends ReserveState 
{
  final String message;
  ReserveError({required this.message});
}
