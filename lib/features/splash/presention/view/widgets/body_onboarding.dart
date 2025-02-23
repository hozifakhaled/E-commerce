import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/splash/presention/view/widgets/build_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyOnboarding extends StatefulWidget {
  const BodyOnboarding({super.key});

  @override
  State<BodyOnboarding> createState() => _BodyOnboardingState();
}

class _BodyOnboardingState extends State<BodyOnboarding> {
  final PageController _controller = PageController(); // متحكم في صفحات العرض

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller, // ربط المتحكم بصفحات العرض
          children: [
            BuildPage(
              image: Assets.imagesOnboarding1,
              title: 'Purchase Online !!', // عنوان الصفحة الأولى
              description: 'Browse and purchase your favorite products online.', // وصف الصفحة الأولى
            ),
            BuildPage(
              image: Assets.imagesOnboarding2,
              title: 'Track Order !!', // عنوان الصفحة الثانية
              description: 'Keep an eye on your orders every step of the way.', // وصف الصفحة الثانية
            ),
            BuildPage(
              image: Assets.imagesOnboarding3png,
              title: 'Get Your Order !!', // عنوان الصفحة الثالثة
              description: 'Receive your order quickly and hassle-free.', // وصف الصفحة الثالثة
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _controller, // ربط المتحكم بمؤشر الصفحات
                  count: 3, // عدد النقاط في المؤشر
                  effect: ExpandingDotsEffect(
                    activeDotColor: maincolor, // لون النقطة النشطة
                    dotHeight: 8, // ارتفاع النقطة
                    dotWidth: 8, // عرض النقطة
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50.h,
                  width: 50.h,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // شكل الزر دائري
                      ),
                      color: maincolor, // لون الزر
                      onPressed: () {
                        if (_controller.page == 2) {
                          // إذا كانت الصفحة الحالية هي الصفحة الثالثة
                          GoRouter.of(context).go(AppRoutes.login); // الانتقال إلى صفحة تسجيل الدخول
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500), // مدة الانتقال بين الصفحات
                            curve: Curves.ease, // منحنى الانتقال
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: maincolor2, // لون الأيقونة
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
