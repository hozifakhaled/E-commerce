import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/presention/view/widgets/section_text_and_image_in_forget_password.dart';
import 'package:flutter/material.dart';

class BodyForgetPasswordView extends StatelessWidget {
  const BodyForgetPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
return Form(
   // مفتاح النموذج
  child: Padding(
    padding: const EdgeInsets.all(16.0), // إضافة حشوة حول المحتوى
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
        children: [
         // SizedBox(height: context.height * .1), // إضافة مساحة فارغة
          SectionTextAndImageInForgetPassword(), // إضافة قسم النص والصورة
       CustomTextFromFiled(hinttext: 'Enter your email'),
          const SizedBox(height: 40), // إضافة مساحة فارغة
          ButtonApp(color: maincolor,
              colortext: Colors.white,
            onPressed: () {
             
            },
            text: 'Continue',
          ) // زر التطبيق
        ],
      ),
    ),
  ),
);
  }
}
