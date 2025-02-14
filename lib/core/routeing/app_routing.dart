//import 'package:bookly/Features/home/data/models/book_model/book_model.dart';

import 'package:ecommercefirebase/features/auth/login/presention/view/login_view.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/view/sinup_view.dart';
import 'package:ecommercefirebase/features/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/categories/presention/view/product_detales.dart';
import 'package:ecommercefirebase/features/comments/presentation/pages/add_comment_view.dart';
import 'package:ecommercefirebase/features/home/presention/view/home_view.dart';
import 'package:ecommercefirebase/features/profile/presentation/pages/profile_view.dart';
import 'package:ecommercefirebase/features/splash/presention/view/onboarding_view.dart';
import 'package:ecommercefirebase/features/splash/presention/view/splah_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static var router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (
        context,
        state,
      ) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/onb',
      builder: (
        context,
        state,
      ) {
        return const OnboardingPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: '/sinup',
      builder: (context, state) {
        return const SinupView();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (
        context,
        state,
      ) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/details',
      builder: (
        context,
        state,
      ) {
        return ProductDetales(
          productEntitiy: state.extra as ProductEntitiy,
        );
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (
        context,
        state,
      ) {
        return ProfileView(
          id: state.extra as String,
        );
      },
    ),
    GoRoute(
      path: '/addcomment',
      builder: (
        context,
        state,
      ) {
        return const AddCommentView();
      },
    ),
  ]);
}
