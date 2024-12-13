import 'package:atele_online/feature/categories/data/model/category_model.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharedDataCubit extends Cubit<Map<String, dynamic>> {
  SharedDataCubit() : super({});

  void setCategory(CategoryModel category) {
    emit({...state, "selectedCategory": category});
  }

  void setProduct(ProductModel product) {
    emit({...state, "selectedProduct": product});
  }

  void setAppointmentTime(String time, String date) {
    final timeParts = time.split(':');
    final dateParts = date.split('-');

    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1].split(' ')[0]);

    final adjustedHour = hour >= 12 ? hour : hour + 12;

    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);

    final appointmentTime = DateTime(year, month, day, adjustedHour, minute);

    emit({
      ...state,
      "appointmentTime": appointmentTime,
    });
  }

  void clearData() {
    emit({});
  }

  Map<String, dynamic> getData() => state;
}
