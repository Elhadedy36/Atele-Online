import 'package:go_router/go_router.dart';

void customNavigate(context, {required String path, Object? extra}) {
  GoRouter.of(context).push(path, extra: extra);
}

void customNavigaeReplacement(context, {required String path, Object? extra}) {
  GoRouter.of(context).pushReplacement(path, extra: extra);
}
