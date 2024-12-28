import 'package:atele_online/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:atele_online/feature/auth/presentation/view/forgot_password_view.dart';
import 'package:atele_online/feature/auth/presentation/view/signin_view.dart';
import 'package:atele_online/feature/auth/presentation/view/signup_view.dart';
import 'package:atele_online/feature/reservations/presentation/cubit/reserve_cubit.dart';
import 'package:atele_online/feature/store/presentation/cubit/cubit/products_cubit.dart';
import 'package:atele_online/feature/home/presentation/cubit/home_cubit.dart';
import 'package:atele_online/feature/home/presentation/widgets/custom_hoom_nav_bar.dart';
import 'package:atele_online/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:atele_online/feature/profile/presentation/cubit/account_details_cubit.dart';
import 'package:atele_online/feature/profile/presentation/views/account_view.dart';
import 'package:atele_online/feature/reservations/presentation/views/appointment_view.dart';
import 'package:atele_online/feature/reservations/presentation/views/checkout_view.dart';
import 'package:atele_online/feature/splash_screen/presentation/view/spalsh_view.dart';
import 'package:atele_online/feature/store/presentation/views/items_view.dart';
import 'package:atele_online/feature/store/presentation/widgets/Store_Tab_View_Builder.dart';
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
      child: const SignUpView(),
    ),
  ),
  GoRoute(
      path: '/AccountView',
      builder: (context, state) => BlocProvider(
            create: (context) => AccountDetailsCubit()..getUserDetails(),
            child: const AccountView(),
          )),
  GoRoute(
      path: '/HoomNavBar',
      builder: (context, state) => BlocProvider(
            create: (context) => HomeCubit(itemCount: 5),
            child: const HomeNavBarWidget(),
          )),
  GoRoute(
      path: '/StoreView',
      builder: (context, state) => BlocProvider(
            create: (context) => ProductsCubit(),
            child: const StoreTabViewBuilder(),
          )),
  GoRoute(
      path: '/DataAndTimeView',
      builder: (context, state) => BlocProvider(
            create: (context) => ReserveCubit(),
            child: const Appointment(),
          )),
  GoRoute(
      path: '/ChackoutView',
      builder: (context, state) => BlocProvider(
            create: (context) => ReserveCubit(),
            child: const CheckoutView(),
          )),
  GoRoute(path: '/itemView', builder: (context, state) => const ItemView()),
  GoRoute(
      path: '/forgotPassword',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgotPasswordView(),
          )),
]);
