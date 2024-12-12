part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;

  CategoriesSuccess({required this.categories});
}

class CategoriesError extends CategoriesState {
  final String error;

  CategoriesError({required this.error});
}
