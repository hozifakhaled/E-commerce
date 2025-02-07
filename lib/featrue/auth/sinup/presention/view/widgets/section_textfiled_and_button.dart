import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/manger/cubit/sinup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionTextfiledAndButton extends StatefulWidget {
  const SectionTextfiledAndButton({super.key});

  @override
  State<SectionTextfiledAndButton> createState() =>
      _SectionTextfiledAndButtonState();
}

class _SectionTextfiledAndButtonState extends State<SectionTextfiledAndButton> {
  bool isheddin = true;
   String email = '';
  String password = '';
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController psswordcontroller = TextEditingController();  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'email',
          style: Textstyles.text2otp
              .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        CustomTextFromFiled(
          hinttext: 'example@gmail.com',
          controller: emailcontroller,
          validator: (value) =>
              context.read<SinupCubit>().validatoremail(value),
          onChanged: (p0) {
            context.read<SinupCubit>().email = p0;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'password',
          style: Textstyles.text2otp
              .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        CustomTextFromFiled(
          obscureText: isheddin,
          hinttext: 'Enter your password',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (isheddin == false) {
                    isheddin = true;
                  } else {
                    isheddin = false;
                  }
                });
              },
              icon: Icon(Icons.remove_red_eye_outlined)),
          controller: psswordcontroller,
          onChanged: (p0) {
            context.read<SinupCubit>().password = p0;
          },
          validator: (p0) => context.read<SinupCubit>().validatorpassword(p0),
        ),
        const SizedBox(
          height: 50,
        ),
        buttonApp(
          text: 'Signup',
          onPressed: () {
            if (context.read<SinupCubit>().formKey.currentState!.validate()) {
              context
                  .read<SinupCubit>()
                  .createUserWithEmailAndPassword(email, password);
              psswordcontroller.clear();
              emailcontroller.clear();
            }
          },
          colortext: Colors.white,
          color: maincolor,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
