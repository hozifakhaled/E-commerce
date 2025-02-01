// ignore: file_names
// ignore: file_names
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeTextFieldInOtp extends StatelessWidget {
  const PinCodeTextFieldInOtp({
    super.key,
    this.onCompleted,
    this.controller,
  });
  final TextEditingController? controller;
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: PinCodeTextField(
        controller: controller,
        mainAxisAlignment: MainAxisAlignment.center,
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        length: 6, // طول رمز التحقق (OTP) هو 4 خانات
        obscureText: true, // إخفاء النص المدخل باستخدام رمز النجمة (*)
        obscuringCharacter: '*', // رمز الإخفاء هو النجمة (*)

        blinkWhenObscuring: true, // وميض عند الإخفاء

        validator: (v) {
          if (v!.length < 6) {
            return "I'm from validator"; // رسالة خطأ إذا كان طول النص أقل من 4
          } else {
            return null;
          }
        },

        pinTheme: PinTheme(
          inactiveColor: Color(0xffDDDDDD), // لون الحقل غير النشط
          fieldOuterPadding: EdgeInsets.all(10), // حواف الحقل الخارجية
          selectedColor: maincolor, // لون الحقل المحدد
          activeColor: Color(0xffDDDDDD), // لون الحقل النشط
          errorBorderColor: Colors.red, // لون حافة الحقل عند حدوث خطأ
          selectedFillColor: Colors.white, // لون تعبئة الحقل المحدد
          inactiveFillColor: Colors.white, // لون تعبئة الحقل غير النشط
          shape: PinCodeFieldShape.box, // شكل الحقل (مربع)
          borderRadius: BorderRadius.circular(10), // نصف قطر حواف الحقل
          fieldHeight: context.width * .1, // ارتفاع الحق
          fieldWidth: context.width * .1, // عرض الحقل
          activeFillColor: Colors.white, // لون تعبئة الحقل النشط
        ),
        cursorColor: Color(0xffDDDDDD), // لون المؤشر
        animationDuration: const Duration(milliseconds: 300), // مدة الحركة
        enableActiveFill: true, // تمكين تعبئة الحقل النشط

        keyboardType: TextInputType.number, // نوع لوحة المفاتيح (أرقام)
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Color(0xffDDDDDD), // لون الظل
            blurRadius: 10, // نصف قطر التمويه
          )
        ],
        onCompleted: onCompleted,
        // onTap: () {
        //   print("Pressed");
        // },

        beforeTextPaste: (text) {
          debugPrint(
              "Allowing to paste $text"); // طباعة رسالة عند السماح باللصق
          return true; // السماح باللصق
        },
      ),
    );
  }
}

// هذا الكود يعرض حقل إدخال رمز التحقق (OTP) باستخدام مكتبة PinCodeFields في فلاتر. 
// يحتوي الحقل على 4 خانات، ويخفي النص المدخل باستخدام رمز النجمة (*)، 
// ويحتوي على مدقق للتحقق من طول النص المدخل. 
// كما يحتوي على إعدادات مخصصة للمظهر مثل الألوان والحواف والظلال.
