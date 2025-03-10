import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/manger/cubit/sinup_cubit.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/view/widgets/section_textfiled_and_button.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/view/widgets/text_and_image_in_sinup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// This widget represents the body of the sign-up view
class BodySinupView extends StatelessWidget {
  const BodySinupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SinupCubit, SinupState>(
      // Listener for the SinupCubit state changes
      listener: (context, state) {
        if (state is SinupLoaded) {
          // If sign-up is successful, add user details and show success dialog
          context.read<SinupCubit>().adduser(
              email: context.read<SinupCubit>().email!,
              name: context.read<SinupCubit>().name!,
              phone: context.read<SinupCubit>().phone!,
              age: context.read<SinupCubit>().age!);
          Helpers()
              .alertDone(context, 'Done', 'Sign up successfully', null,
                  () => GoRouter.of(context).go('/home', extra: context.read<SinupCubit>().email), DialogType.success)
              .show();
        }
        if (state is SinupError) {
          // If there is an error during sign-up, show error dialog
          Helpers()
              .alertDone(context, 'Error', state.message.toString(), null, null,
                  DialogType.error)
              .show();
        }
      },
      // Form for the sign-up process
      child: Form(
        key: context.read<SinupCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget displaying text and image for sign-up
                  const TextAndImage(),
                  // Widget containing text fields and button for sign-up
                  const SectionTextfiledAndButton(),
                ]),
          ),
        ),
      ),
    );
  }
}
