// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  Future<void> startSplash(context) async {
    await Future.delayed(const Duration(seconds: 4),() => GoRouter.of(context).go('/sinup'),);

     // فترة الانتظار
    emit(SplashSecuess()); // الانتقال إلى الشاشة الرئيسية بعد 3 ثواني
  }
}
