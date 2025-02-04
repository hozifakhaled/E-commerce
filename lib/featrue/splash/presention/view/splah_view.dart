import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/featrue/splash/presention/manger/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late AnimationController _rotateController;

  late Animation<Offset> _clickAnimation;
  late Animation<Offset> _goAnimation;

  @override
  void initState() {
    super.initState();

    // حركة Click و Go
    _clickController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _goController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // دوران علامة &
    _rotateController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _clickAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0), // بداية Click خارج الشاشة
      end: const Offset(0.0, 0),
    ).animate(CurvedAnimation(
      parent: _clickController,
      curve: Curves.easeInOut,
    ));

    _goAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0), // بداية Go خارج الشاشة
      end: const Offset(0.0, 0),
    ).animate(CurvedAnimation(
      parent: _goController,
      curve: Curves.easeInOut,
    ));

    _startAnimations();
  }

  void _startAnimations() async {
  await _clickController.forward();
  await _goController.forward();
  await _rotateController.forward(); // دوران مرة واحدة
}


  @override
  void dispose() {
    _clickController.dispose();
    _goController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..startSplash(context),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSecuess) {
          //  GoRouter.of(context).go('/home');
          }
        },
        child: Scaffold(
          backgroundColor: TextFieldColor,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _clickAnimation,
                  child: Text(
                    'Click',
                    style: TextStyle(fontSize: 32, color: maincolor),
                  ),
                ),
                const SizedBox(width: 8),
                RotationTransition(
                  turns: _rotateController,
                  child: Text(
                    '&',
                    style: TextStyle(fontSize: 32, color: maincolor),
                  ),
                ),
                const SizedBox(width: 8),
                SlideTransition(
                  position: _goAnimation,
                  child: Text(
                    'Go',
                    style: TextStyle(fontSize: 32, color: maincolor),
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
