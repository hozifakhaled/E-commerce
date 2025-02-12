import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/image_profile_in_profile.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/profile_row.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/setting_column_in_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            ColumnProfile(),
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

class ColumnProfile extends StatelessWidget {
  const ColumnProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoaded) {
        return Column(
          children: [
            ImageProfileInProfile(),
            const SizedBox(height: 30),
            ProfileRow(
              title: 'Name',
              value:state.profileEntitiey.name,
            ),
            const SizedBox(height: 25),
            ProfileRow(
              title: 'Phone',
              value: state.profileEntitiey.phone,
            ),
            const SizedBox(height: 25),
            ProfileRow(
              title: 'Email',
              value: state.profileEntitiey.email,
            ),
            const SizedBox(height: 25),
            ProfileRow(
              title: 'Age',
              value: '${state.profileEntitiey.age} years old',
            ),
          ],
        );
      } else if (state is ProfileError) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
