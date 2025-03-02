import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/manger/cubit/sinup_cubit.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/view/widgets/body_sinup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SinupView extends StatelessWidget {
  const SinupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // إنشاء SinupCubit وتوفيره للشجرة
      create: (context) => SinupCubit(),
      child: BlocBuilder<SinupCubit, SinupState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SinupLoading,
            child: Scaffold(
              backgroundColor: maincolor2,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: maincolor2,
                toolbarHeight: 40.h,
                // إضافة شعار مخصص في شريط التطبيق
                title: CustomTitleLogo(
                  textcolor1: Colors.black,
                  textcolor2: maincolor,
                ),
              ),
              // عرض محتوى BodySinupView
              body: BodySinupView(),
            ),
          );
        },
      ),
    );
  }
}
