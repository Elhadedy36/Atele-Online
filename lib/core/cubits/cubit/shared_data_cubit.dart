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
    // Format and save time in HH:mm (24-hour) format
    final timeParts = time.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1].split(' ')[0]);
    final period = timeParts[1].split(' ')[1];

    final adjustedHour = period.toLowerCase() == 'pm' && hour != 12
        ? hour + 12
        : (period.toLowerCase() == 'am' && hour == 12 ? 0 : hour);

    final formattedTime = '${adjustedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    // Format and save date in YYYY-MM-DD format
    final dateParts = date.split('-');
    final year = dateParts[0];
    final month = dateParts[1].padLeft(2, '0');
    final day = dateParts[2].padLeft(2, '0');

    final formattedDate = '$year-$month-$day';

    emit({
      ...state,
      "appointmentTime": formattedTime, // Time only (HH:mm)
      "appointmentDate": formattedDate, // Date only (YYYY-MM-DD)
    });
  }

  void clearData() {
    emit({});
  }

  Map<String, dynamic> getData() => state;
}
