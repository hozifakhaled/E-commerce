import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/manger/cubit/sinup_cubit.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/view/widgets/body_sinup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SinupView extends StatelessWidget {
  const SinupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SinupCubit(),
      child: Scaffold(
        backgroundColor: TextFieldColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: TextFieldColor,
          toolbarHeight: 40.h,
          title: CustomTitleLogo(),
        ),
        body: BodySinupView(),
      ),
    );
  }
}
