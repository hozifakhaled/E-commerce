import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/presention/manger/cubit/forget_password_cubit.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/presention/view/widgets/body_forget_password_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ForgetPasswordLoading,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 100.h,
                automaticallyImplyLeading: false,
                backgroundColor: maincolor2,
                title: CustomTitleLogo(
                    textcolor1: Colors.black, textcolor2: maincolor),
              ),
              backgroundColor: maincolor2, // تعيين لون الخلفية للأبيض
              body: BodyForgetPasswordView(),
            ),
          );
        },
      ),
    );
  }
}
