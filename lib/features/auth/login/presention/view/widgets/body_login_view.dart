import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/features/auth/login/presention/manger/cubit/login_cubit.dart';
import 'package:ecommercefirebase/features/auth/login/presention/view/widgets/section_image_and_text_in_login.dart';
import 'package:ecommercefirebase/features/auth/login/presention/view/widgets/section_textfiled_and_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BodyLoginView extends StatelessWidget {
  const BodyLoginView({super.key});

  @override
  Widget build(BuildContext context) {
   
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Helpers()
              .alertDone(context, 'Done', 'Login successfully', null,
                  () => GoRouter.of(context).go(AppRoutes.home,extra: context.read<LoginCubit>().email), DialogType.success)
              .show();
        }
        if (state is LoginError) {
          Helpers()
              .alertDone(context, 'Error', state.massge.toString(), null, null,
                  DialogType.error)
              .show();
        }
      },
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            
            const SectionImageAndTextInLogin(),
            const SectionTextfiledAndButton(), 
            ]),
          ),
        ),
      ),
    );
  }
}

