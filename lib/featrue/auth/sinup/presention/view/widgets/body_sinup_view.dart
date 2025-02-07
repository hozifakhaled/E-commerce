import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/manger/cubit/sinup_cubit.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/view/widgets/section_textfiled_and_button.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/view/widgets/text_and_image_in_sinup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BodySinupView extends StatelessWidget {
  const BodySinupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SinupCubit, SinupState>(
      listener: (context, state) {
        if (state is SinupLoaded) {
          Helpers()
              .alertDone(context, 'Done', 'Sign up successfully', null,
                  () => GoRouter.of(context).go('/home'), DialogType.success)
              .show();
        }
        if (state is SinupError) {
          Helpers()
              .alertDone(context, 'Error', state.message.toString(), null, null,
                  DialogType.error)
              .show();
        }
      },
      child: Form(
        key: context.read<SinupCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextAndImage(),
                  BlocProvider(
                    create: (context) => SinupCubit(),
                    child: const SectionTextfiledAndButton(),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
