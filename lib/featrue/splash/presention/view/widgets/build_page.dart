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
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(image, height: 250)),
            const SizedBox(height: 32),
            SizedBox(
              height: 80.h,
            ),
            Text(
              title,
              style: Textstyles.text28,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              // textAlign: TextAlign.center,
              style: Textstyles.text20.copyWith(color: const Color.fromARGB(255, 95, 94, 94)),
            ),
            // const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
