// ignore: file_names
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/presention/manger/cubit/forget_password_cubit.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/presention/view/widgets/section_text_and_image_in_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BodyForgetPasswordView extends StatelessWidget {
  const BodyForgetPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordloaded) {
          Helpers()
              .alertDone(context, 'Done', '✅ Password reset link sent! Check your email', null,
                  () => GoRouter.of(context).go(AppRoutes.login), DialogType.success)
              .show();
        }
        if (state is ForgetPasswordError) {
          Helpers()
              .alertDone(context, 'Error', state.message.toString(), null, null,
                  DialogType.error)
              .show();
        }
      },
      child: Form(
        // مفتاح النموذج
        child: Padding(
          padding: const EdgeInsets.all(16.0), // إضافة حشوة حول المحتوى
          child: SingleChildScrollView(
            child: Form(
              key: context.read<ForgetPasswordCubit>().formKey, // مفتاح النموذج
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
                children: [
                  // SizedBox(height: context.height * .1), // إضافة مساحة فارغة
                  SectionTextAndImageInForgetPassword(), // إضافة قسم النص والصورة
                  CustomTextFromFiled(
                    hinttext: 'Enter your email', // نص تلميحي لحقل البريد الإلكتروني
                    controller:
                        context.read<ForgetPasswordCubit>().emailController,
                    onChanged: (p0) =>
                        context.read<ForgetPasswordCubit>().email = p0,
                    validator: (p0) =>
                        context.read<ForgetPasswordCubit>().validatoremail(p0),
                  ),
                  const SizedBox(height: 40), // إضافة مساحة فارغة
                  ButtonApp(
                    color: maincolor, // لون الزر
                    colortext: Colors.white, // لون نص الزر
                    onPressed: () {
                      if (context
                          .read<ForgetPasswordCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<ForgetPasswordCubit>().forgetPassword(
                            context.read<ForgetPasswordCubit>().email!);
                        context
                            .read<ForgetPasswordCubit>()
                            .emailController
                            .clear();
                      }
                    },
                    text: 'Continue', // نص الزر
                  ) // زر التطبيق
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
