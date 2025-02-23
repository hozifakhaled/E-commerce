import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/auth/login/presention/manger/cubit/login_cubit.dart';
import 'package:ecommercefirebase/features/auth/login/presention/view/widgets/body_login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// واجهة تسجيل الدخول
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // إنشاء LoginCubit
      create: (context) =>  LoginCubit(),
      child: Scaffold(
        // لون خلفية الواجهة
        backgroundColor: maincolor2,
        appBar: AppBar(
          // لون خلفية شريط التطبيق
          backgroundColor: maincolor2,
          // ارتفاع شريط الأدوات
          toolbarHeight: 40.h,
          // عنوان مخصص لشعار التطبيق
          title: CustomTitleLogo(
            textcolor1: Colors.black,
            textcolor2: maincolor,
          ),
        ),
        // جسم واجهة تسجيل الدخول
        body: BodyLoginView(),
      ),
    );
  }
}
