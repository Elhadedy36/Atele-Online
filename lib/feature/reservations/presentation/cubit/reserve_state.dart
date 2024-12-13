part of 'reserve_cubit.dart';

@immutable
abstract class ReserveState {}

class ReserveInitial extends ReserveState {}

class ReserveLoading extends ReserveState {}

class ReserveSuccess extends ReserveState {}

class ReserveError extends ReserveState {
  final String message;
  ReserveError({required this.message});
}class ReserveProductLoaded extends ReserveState {
  final List<ProductModel> product;
 

  ReserveProductLoaded({required this.product});
}
