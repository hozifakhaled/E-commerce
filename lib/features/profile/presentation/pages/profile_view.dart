import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecommercefirebase/features/profile/presentation/widgets/body_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.id});
 final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(id),
      child: Scaffold(
        backgroundColor: maincolor2,
        body: BodyProfileView(),
      ),
    );
  }
}
