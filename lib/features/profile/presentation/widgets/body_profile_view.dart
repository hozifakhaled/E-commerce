import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecommercefirebase/features/profile/presentation/widgets/column_profile.dart';
import 'package:ecommercefirebase/features/profile/presentation/widgets/setting_column_in_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProfileView extends StatelessWidget {
  const BodyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
          if (state is ProfileLoaded) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    ColumnProfile(profileEntitiey: state.profileEntitiey,),
                    const SizedBox(height: 40),
                    Text(
                      'Comments & Complaints',
                      style: Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SettingColumnInProfile(name:state.profileEntitiey.name ,image: state.profileEntitiey.image,),
                    const SizedBox(height: 30),
                    ButtonApp(  onPressed: (){
                      context.read<ProfileCubit>().logout(context);
                    }, text: 'Log Out', color: maincolor, colortext: maincolor2)
                  ],
                );
          
            
          } else if (state is ProfileError) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return Center(
          child: const CircularProgressIndicator(),
        );
      }},
        ),
      ),
    );
  }
}

