import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/featrue/splash/presention/manger/cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
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

    // حركة "Click" و "Go"
    _clickController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _goController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // دوران علامة "&"
    _rotateController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _clickAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0), // بداية "Click" خارج الشاشة
      end: const Offset(0.0, 0),
    ).animate(CurvedAnimation(
      parent: _clickController,
      curve: Curves.easeInOut,
    ));

    _goAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0), // بداية "Go" خارج الشاشة
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
                // استخدام Stack لدمج علامة "&" مع أنيميشن النقاط
                Stack(
                  alignment: Alignment.center,
                  children: [
                    RotationTransition(
                      turns: _rotateController,
                      child: Text(
                        '&',
                        style: TextStyle(fontSize: 32, color: maincolor),
                      ),
                    ),
                    // أنيميشن النقاط
                    AnimatedBuilder(
                      animation: _rotateController,
                      builder: (context, child) {
                        return DotsAnimation(
                          progress: _rotateController.value,
                          color: maincolor,
                        );
                      },
                    ),
                  ],
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

// Widget يقوم بعرض النقاط باستخدام CustomPainter
class DotsAnimation extends StatelessWidget {
  final double progress; // قيمة الأنيميشن من 0 إلى 1
  final Color color;
  const DotsAnimation({Key? key, required this.progress, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // يمكن تعديل الحجم حسب الحاجة
    return CustomPaint(
      painter: DotPainter(progress, color),
      size: const Size(50, 50),
    );
  }
}

// CustomPainter لرسم النقاط
class DotPainter extends CustomPainter {
  final double progress;
  final Color color;

  DotPainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final center = Offset(size.width / 2, size.height / 2);
    // تحديد المسافة القصوى التي يمكن للنقاط الوصول إليها
    final maxRadius = size.width / 2;
    final currentRadius = progress * maxRadius;
    // رسم 8 نقاط موزعة بزاوية دائرية حول المركز
    const int numberOfDots = 8;
    for (int i = 0; i < numberOfDots; i++) {
      final angle = (2 * pi * i / numberOfDots);
      final dotCenter = Offset(
        center.dx + currentRadius * cos(angle),
        center.dy + currentRadius * sin(angle),
      );
      // يمكن تغيير حجم النقطة هنا (radius = 3)
      canvas.drawCircle(dotCenter, 3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant DotPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
