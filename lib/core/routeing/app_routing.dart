//import 'package:bookly/Features/home/data/models/book_model/book_model.dart';

import 'package:ecommercefirebase/featrue/auth/otp/presention/view/otp_view.dart';
import 'package:ecommercefirebase/featrue/auth/otp/presention/view/verification_code_view.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static var router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context,  state) {
        return const OtpView();
      },
    ),
 
  
    GoRoute(
      path: '/code',
      
      builder: (context,  state, ) {
        return  VerificationCodeView(verificationId:state.extra as String   ,);
      },
    ),
    GoRoute(
      path: '/home',
      
      builder: (context,  state, ) {
        return const  HomeView();
      },
    ),
  ]);
}
