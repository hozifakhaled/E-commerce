// ignore: file_names
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/featrue/auth/otp/presention/manger/cubit/otp_cubit.dart';
import 'package:ecommercefirebase/featrue/auth/otp/presention/view/widgets/section_text_and_image_in_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'phone_textfiled_in_otp.dart';

// ignore: must_be_immutable
class BodyInOtp extends StatelessWidget {
  const BodyInOtp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? phone = context.read<PhoneAuthCubit>().phone; // الحصول على رقم الهاتف من الكيوبت
    TextEditingController controller =
        context.read<PhoneAuthCubit>().controllerphone; // الحصول على وحدة التحكم من الكيوبت
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state.error != null) {
          Helpers()
              .alertDone(context, 'Error', state.error.toString(), null, null,
                  DialogType.error)
              .show(); // عرض رسالة خطأ إذا كان هناك خطأ
        } else if (state.verificationId != null) {
          GoRouter.of(context).go('/code', extra: state.verificationId!); // الانتقال إلى صفحة التحقق إذا تم الحصول على معرف التحقق
        } else {}
      },
      child: Form(
        key: context.read<PhoneAuthCubit>().fromkeyphone, // مفتاح النموذج
        child: Padding(
          padding: const EdgeInsets.all(16.0), // إضافة حشوة حول المحتوى
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
              children: [
                SizedBox(height: context.height * .1), // إضافة مساحة فارغة
                sectionTextAndImageInOtp(), // إضافة قسم النص والصورة
                phoneTextfiledInOtp(
                  controller: controller,
                  onSaved: (p0) {
                    phone = p0!;
                  },
                ), // حقل إدخال رقم الهاتف
                const SizedBox(height: 40), // إضافة مساحة فارغة
                buttonApp(color: maincolor,
                    colortext: Colors.white,
                  onPressed: () {
                    // GoRouter.of(context).go('/code');
                    if (context
                        .read<PhoneAuthCubit>()
                        .fromkeyphone
                        .currentState!
                        .validate()) {
                      controller.clear(); // مسح وحدة التحكم
                      context.read<PhoneAuthCubit>().verifyPhone(phone!); // التحقق من رقم الهاتف
                    }
                    //    print(phone);
                  },
                  text: 'Continue',
                ) // زر التطبيق
              ],
            ),
          ),
        ),
      ),
    );
  }
}
