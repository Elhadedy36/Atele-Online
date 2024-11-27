import 'package:atele_online/feature/home/presentation/widgets/custom_hoom_nav_bar.dart';
import 'package:atele_online/feature/splash_screen/presentation/view/spalsh_view.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SpalshView()),
  GoRoute(path: '/HoomNavBar', builder: (context, state) => const HomeNavBarWidget()),
  
]);
