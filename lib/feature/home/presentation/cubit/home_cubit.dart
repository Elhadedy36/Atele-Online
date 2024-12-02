import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  late Timer _timer;
  final int itemCount;
  bool _isReversing = false; // لتحديد الاتجاه (للخلف أو للأمام)

  HomeCubit({required this.itemCount}) : super(0) {
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (!_isReversing) {
        if (state < itemCount - 1) {
          emit(state + 1); // الانتقال إلى الصورة التالية
        } else {
          _isReversing = true; // إذا وصلنا إلى آخر صورة، نبدأ بالعودة للخلف
          emit(state - 1);
        }
      } else {
        if (state > 0) {
          emit(state - 1); // الانتقال للصورة السابقة
        } else {
          _isReversing = false; // إذا وصلنا إلى الصورة الأولى، نبدأ بالتقدم للأمام
          emit(state + 1);
        }
      }
    });
  }

  @override
  Future<void> close() {
    _timer.cancel(); // تنظيف المؤقت عند التخلص من Cubit
    return super.close();
  }
}
