import 'package:bloc/bloc.dart'; // ignore: depend_on_referenced_packages
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  // دالة لبدء شاشة البداية
  Future<void> startSplash(context) async {
    // التحقق مما إذا كان هناك مفتاح 'id' في التخزين المؤقت
    if (await CacheHelper().containsKey(key: 'id') == true) {
      // الانتظار لمدة 4 ثواني ثم الانتقال إلى الشاشة الرئيسية
      await Future.delayed(
        const Duration(seconds: 4),
        () => GoRouter.of(context).go(AppRoutes.home),
      );
    } else {
      // الانتظار لمدة 4 ثواني ثم الانتقال إلى شاشة الإعدادات الأولية
      await Future.delayed(
        const Duration(seconds: 4),
        () => GoRouter.of(context).go(AppRoutes.onboarding),
      );
    }
    // فترة الانتظار
    emit(SplashSecuess()); // الانتقال إلى الشاشة الرئيسية بعد 3 ثواني
  }
}
