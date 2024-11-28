
import 'package:atele_online/feature/auth/presentation/view/signin_view.dart';
import 'package:atele_online/feature/auth/presentation/view/signup_view.dart';
import 'package:atele_online/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:atele_online/feature/splash_screen/presentation/view/spalsh_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SpalshView()),
  GoRoute(path: '/onboarding', builder: (context, state) => const OnBoardingView()),
  GoRoute(path: '/signin', builder: (context, state) => const SigninView()),
  GoRoute(path: '/signup', builder: (context, state) => const SignUpView()),
  
]);
