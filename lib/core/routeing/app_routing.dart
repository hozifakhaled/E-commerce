//import 'package:bookly/Features/home/data/models/book_model/book_model.dart';

import 'package:ecommercefirebase/featrue/auth/login/presention/view/login_view.dart';
import 'package:ecommercefirebase/featrue/auth/otp/presention/view/verification_code_view.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/view/sinup_view.dart';
import 'package:ecommercefirebase/featrue/splash/presention/view/splah_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static var router = GoRouter(routes: <RouteBase>[
    
    GoRoute(
      path: '/code',
      builder: (
        context,
        state,
      ) {
        return VerificationCodeView(
          verificationId: state.extra as String,
        );
      },
    ),
    GoRoute(
      path: '/',
      builder: (
        context,
        state,
      ) {
        return  SplashScreen();
      },
    ),GoRoute(
      path: '/home',
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
  ]);
}
