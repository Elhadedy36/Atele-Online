import 'package:atele_online/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:atele_online/feature/auth/presentation/view/signin_view.dart';
import 'package:atele_online/feature/auth/presentation/view/signup_view.dart';
import 'package:atele_online/feature/categories/cubit/categories_cubit.dart';
import 'package:atele_online/feature/categories/presentation/views/evening_dress_view.dart';
import 'package:atele_online/feature/categories/presentation/views/items_view.dart';
import 'package:atele_online/feature/categories/presentation/views/wedding_dress_view.dart';
import 'package:atele_online/feature/home/presentation/cubit/home_cubit.dart';
import 'package:atele_online/feature/home/presentation/widgets/custom_hoom_nav_bar.dart';
import 'package:atele_online/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:atele_online/feature/splash_screen/presentation/view/spalsh_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SpalshView()),
  GoRoute(
      path: '/onboarding', builder: (context, state) => const OnBoardingView()),
  GoRoute(
      path: '/signin',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SigninView(),
          )),
  GoRoute(
      path: '/signup',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),),),
            
            GoRoute(
      path: '/HoomNavBar',
      builder: (context, state) => BlocProvider(
            create: (context) => HomeCubit(itemCount: 5),
            child: const HomeNavBarWidget(),
          )),
  GoRoute(
      path: '/WeddingDressView',
      builder: (context, state) => BlocProvider(
            create: (context) => CategoriesCubit(),
            child: const WeddingDressView(),
          )),
  GoRoute(
      path: '/EveningDressView',
      builder: (context, state) => const EveningDressView()),
      GoRoute(path: '/itemView', builder: (context, state) => const ItemView()),
]);
