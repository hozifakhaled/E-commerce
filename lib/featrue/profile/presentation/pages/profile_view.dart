import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/body_profile_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor2,
      body: BodyProfileView(),
    );
  }
}