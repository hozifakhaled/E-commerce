import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/presention/view/forget_password_view.dart';
import 'package:ecommercefirebase/features/auth/login/presention/view/login_view.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/view/sinup_view.dart';
import 'package:ecommercefirebase/features/categories/presention/view/product_detales.dart';
import 'package:ecommercefirebase/features/checkout/presentation/pages/checkout_view.dart';
import 'package:ecommercefirebase/features/comments/presentation/pages/add_comment_view.dart';
import 'package:ecommercefirebase/features/comments/presentation/pages/all_comment_view.dart';
import 'package:ecommercefirebase/features/home/data/models/categeries_model.dart';
import 'package:ecommercefirebase/features/home/presention/view/custom_products_view.dart';
import 'package:ecommercefirebase/features/home/presention/view/category_view.dart';
import 'package:ecommercefirebase/features/home/presention/view/home_view.dart';
import 'package:ecommercefirebase/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecommercefirebase/features/profile/presentation/pages/profile_view.dart';
import 'package:ecommercefirebase/features/splash/presention/view/onboarding_view.dart';
import 'package:ecommercefirebase/features/splash/presention/view/splah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
       GoRoute(
        path: AppRoutes.forgetpassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SinupView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.details,
        builder: (context, state) => ProductDetales(
          data: state.extra as Map<String, dynamic>,
        ),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => BlocProvider.value(
      value: getIt<ProfileCubit>()..getProfile(state.extra as String),
      child: ProfileView(
          id: state.extra as String,
        )),
      ),
      GoRoute(
        path: AppRoutes.addComment,
        builder: (context, state) => AddCommentView(
          data: state.extra as Map<String, String>,
        ),
      ),
      GoRoute(
        path: AppRoutes.allComments,
        pageBuilder: (context, state) {
          return _customTransitionPage(
            state,
             AllCommentView(name: state.extra as String,),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.category,
        pageBuilder: (context, state) {
          return _customTransitionPage(
            state,
            CategoryView(category: state.extra as CategeriesModel),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.checkout,
        pageBuilder: (context, state) {
          return _customTransitionPage(
            state,
             CheckoutView(price:state.extra as String,),
          );
        },
      ),
       GoRoute(
        path: AppRoutes.customProduct,
        pageBuilder: (context, state) {
          return _customTransitionPage(
            state,
            CustomProductsView(index:  state.extra as int,),
          );
        },
      ),
    ],
  );

  /// **دالة لإنشاء تأثير انتقال مخصص**
  static CustomTransitionPage _customTransitionPage(
      GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0), // دخول من اليمين
            end: Offset.zero, // ينتهي في موضعه الطبيعي
          ).animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),

        );
      },
    );
  }
}