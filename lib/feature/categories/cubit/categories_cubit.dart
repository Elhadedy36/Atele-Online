import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void getCategories() {
    emit(CategoriesLoading());

    _firestore.collection(AppStrings.categories).get().then((snapshot) {
      // Map documents to a list of CategoryModel
      List<CategoryModel> categories = snapshot.docs.map((doc) {
        return CategoryModel.fromJson(doc.data());
      }).toList();

      emit(CategoriesSuccess(categories: categories));
    }).catchError((error) {
      emit(CategoriesError(error: error.toString()));
    });
  }
}
