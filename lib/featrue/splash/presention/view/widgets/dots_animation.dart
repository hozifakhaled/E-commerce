import 'dart:math';

import 'package:flutter/material.dart';

class DotsAnimation extends StatelessWidget {
  final double progress; // قيمة الأنيميشن من 0 إلى 1
  final Color color;
  const DotsAnimation({super.key, required this.progress, required this.color});

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
