part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class GetProductDataLoading extends ProductsState {}
final class GetProductDataSuccess extends ProductsState 
{
  List<ProductModel> productModel;
  GetProductDataSuccess({required this.productModel});
}
final class GetProductDataError extends ProductsState 
{
  final String error;
  GetProductDataError({required this.error});
}
