// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  Future<void> startSplash(context) async {
    if (await CacheHelper().containsKey(key: 'id') == true) {
      await Future.delayed(
        const Duration(seconds: 4),
        () => GoRouter.of(context).go('/home'),
      );
    } else {
    await Future.delayed(
      const Duration(seconds: 4),
      () => GoRouter.of(context).go('/onb'),
    );
}
    // فترة الانتظار
    emit(SplashSecuess()); // الانتقال إلى الشاشة الرئيسية بعد 3 ثواني
  }
}
