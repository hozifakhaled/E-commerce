import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/featrue/splash/presention/view/widgets/build_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyOnboarding extends StatefulWidget {
  const BodyOnboarding({super.key});

  @override
  State<BodyOnboarding> createState() => _BodyOnboardingState();
}

class _BodyOnboardingState extends State<BodyOnboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          children: [
            BuildPage(
              image: Assets.imagesOnboarding1,
              title: 'Purchase Online !!',
              description: 'Browse and purchase your favorite products online.',
            ),
            BuildPage(
              image: Assets.imagesOnboarding2,
              title: 'Track Order !!',
              description: 'Keep an eye on your orders every step of the way.',
            ),
            BuildPage(
              image: Assets.imagesOnboarding3png,
              title: 'Get Your Order !!',
              description: 'Receive your order quickly and hassle-free.',
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
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: maincolor,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: buttonApp(
                      text: 'next',
                      color: maincolor,
                      colortext: maincolor2,
                      onPressed: () {
                        if (_controller.page == 2) {
                          //   print('Navigate to Home');
                          GoRouter.of(context).go('/login');
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
