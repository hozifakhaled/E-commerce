import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/featrue/splash/presention/view/widgets/body_onboarding.dart';
import 'package:flutter/material.dart';

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
        title: CustomTitleLogo(),
        backgroundColor: maincolor2,
      ),
      backgroundColor: maincolor2,
      body: const BodyOnboarding());
  }
}

