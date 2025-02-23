import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPage extends StatelessWidget {
  const BuildPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0), // إضافة حواف حول المحتوى
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
          mainAxisAlignment: MainAxisAlignment.center, // محاذاة العناصر في الوسط
          children: [
            SizedBox(
              height: 40.h, // إضافة مساحة عمودية
            ),
            Align(
                alignment: Alignment.center, // محاذاة الصورة في الوسط
                child: Image.asset(image, height: 250)), // عرض الصورة
            const SizedBox(height: 32), // إضافة مساحة عمودية
            SizedBox(
              height: 80.h, // إضافة مساحة عمودية
            ),
            Text(
              title,
              style: Textstyles.text28, // تطبيق نمط النص
            ),
            const SizedBox(height: 16), // إضافة مساحة عمودية
            Text(
              description,
              // textAlign: TextAlign.center,
              style: Textstyles.text20.copyWith(color: const Color.fromARGB(255, 95, 94, 94)), // تطبيق نمط النص مع تغيير اللون
            ),
            // const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
