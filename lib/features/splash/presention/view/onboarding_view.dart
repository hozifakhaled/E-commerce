import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/splash/presention/view/widgets/body_onboarding.dart';
import 'package:flutter/material.dart';

// صفحة الترحيب
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // شعار مخصص في شريط التطبيق
        title: CustomTitleLogo(
          textcolor1: Colors.black,
          textcolor2: maincolor,
        ),
        backgroundColor: maincolor2,
      ),
      backgroundColor: maincolor2,
      // جسم صفحة الترحيب
      body: const BodyOnboarding(),
    );
  }
}
