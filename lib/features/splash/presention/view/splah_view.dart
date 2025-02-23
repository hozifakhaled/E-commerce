import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/splash/presention/manger/cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _clickController;
  late AnimationController _goController;
  late AnimationController _pulseController;

  late Animation<Offset> _clickAnimation;
  late Animation<Offset> _goAnimation;
 // late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد وحدة التحكم في الرسوم المتحركة للنص "Click"
    _clickController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // إعداد وحدة التحكم في الرسوم المتحركة للنص "Go"
    _goController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // إعداد وحدة التحكم في الرسوم المتحركة لتأثير النبض
    _pulseController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.2,
    )..repeat(reverse: true); // تأثير النبض المستمر

    // إعداد الرسوم المتحركة للنص "Click"
    _clickAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(0.0, 0),
    ).animate(CurvedAnimation(
      parent: _clickController,
      curve: Curves.easeInOut,
    ));

    // إعداد الرسوم المتحركة للنص "Go"
    _goAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: const Offset(0.0, 0),
    ).animate(CurvedAnimation(
      parent: _goController,
      curve: Curves.easeInOut,
    ));

    _startAnimations();
  }

  // بدء الرسوم المتحركة
  void _startAnimations() async {
    await _clickController.forward();
    await _goController.forward();
  }

  @override
  void dispose() {
    // التخلص من وحدات التحكم في الرسوم المتحركة عند التخلص من الشاشة
    _clickController.dispose();
    _goController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..startSplash(context),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSecuess) {
            // الانتقال إلى الشاشة الرئيسية عند نجاح الشاشة الترحيبية
            //  GoRouter.of(context).go('/home');
          }
        },
        child: Scaffold(
          backgroundColor: maincolor2,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _clickAnimation,
                  child: Text(
                    'Click',
                    style: Textstyles.textlogo,
                  ),
                ),
                const SizedBox(width: 8),
                // تأثير النبض حول علامة "&"
                ScaleTransition(
                  scale: _pulseController,
                  child: Text(
                    '&',
                    style: Textstyles.textlogo.copyWith(
                        fontWeight: FontWeight.bold, color: maincolor),
                  ),
                ),
                const SizedBox(width: 8),
                SlideTransition(
                  position: _goAnimation,
                  child: Text(
                    'Go',
                    style: Textstyles.textlogo,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
