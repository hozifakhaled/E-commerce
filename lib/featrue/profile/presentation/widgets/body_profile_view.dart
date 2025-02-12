import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/image_profile_in_profile.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/profile_row.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/setting_column_in_profile.dart';
import 'package:flutter/material.dart';

class BodyProfileView extends StatelessWidget {
  const BodyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 30),
            ImageProfileInProfile(),
              const SizedBox(height: 30),
            ProfileRow(
              title: 'Name',
              value: 'hozifa',
            ),
              const SizedBox(height: 25),
            ProfileRow(
              title: 'Phone',
              value: '01061665307',
            ),
              const SizedBox(height: 25),
            ProfileRow(
              title: 'Email',
              value: 'hozifa@gmail.com',
            ),
              const SizedBox(height: 25),
            ProfileRow(
              title: 'Age',
              value: '22 years old',
            ),
              const SizedBox(height: 40),
            Text(
              'Setting',
              style: Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
            ),
              const SizedBox(height: 10),
            SettingColumnInProfile(),
              const SizedBox(height: 30),
            buttonApp(text: 'Log Out', color: maincolor, colortext: maincolor2)
          ],
        ),
      ),
    );
  }
}
