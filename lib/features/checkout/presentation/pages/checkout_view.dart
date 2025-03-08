import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:ecommercefirebase/features/checkout/presentation/widgets/checkout_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is CheckoutLoading,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: maincolor,
                title: CustomTitleLogo(
                    textcolor1: maincolor2, textcolor2: Colors.black),
              ),
              backgroundColor: maincolor2,
              body: CheckoutBodyView(
                price: price,
              ),
            ),
          );
        },
      ),
    );
  }
}
