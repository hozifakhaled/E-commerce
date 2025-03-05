import 'package:ecommercefirebase/core/stripe/payment_function.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/list_row_summery_in_cart.dart';
import 'package:ecommercefirebase/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutBodyView extends StatelessWidget {
  const CheckoutBodyView({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    double totalPrice = double.parse(price);
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoaded) {
          PaymentFunction.managepayment(totalPrice.toInt(), 'USD');
        } else if (state is CheckoutError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: context.read<CheckoutCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //   spacing: 20,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Select City*',
                  style: Textstyles.text14,
                ),
                CustomTextFromFiled(
                  hinttext: 'Your City',
                  controller: context.read<CheckoutCubit>().cityController,
                  validator: (value) =>
                      context.read<CheckoutCubit>().validator(value),
                  onChanged: (p0) => context.read<CheckoutCubit>().city = p0,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Street Address*',
                  style: Textstyles.text14,
                ),
                CustomTextFromFiled(
                  hinttext: 'Enter street address',
                  controller: context.read<CheckoutCubit>().streetController,
                  validator: (value) =>
                      context.read<CheckoutCubit>().validator(value),
                  onChanged: (p0) => context.read<CheckoutCubit>().street = p0,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                      ),
                      child: SizedBox(
                          width: context.width * .44,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State *',
                                style: Textstyles.text14,
                              ),
                              CustomTextFromFiled(
                                hinttext: 'Enter state',
                                controller: context
                                    .read<CheckoutCubit>()
                                    .stateController,
                                validator: (value) => context
                                    .read<CheckoutCubit>()
                                    .validator(value),
                                onChanged: (p0) =>
                                    context.read<CheckoutCubit>().statee = p0,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                        width: context.width * .43,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Postal Code*',
                              style: Textstyles.text14,
                            ),
                            CustomTextFromFiled(
                              hinttext: 'Enter postal code',
                              controller: context
                                  .read<CheckoutCubit>()
                                  .postalCodeController,
                              validator: (value) => context
                                  .read<CheckoutCubit>()
                                  .validator(value),
                              onChanged: (p0) =>
                                  context.read<CheckoutCubit>().postalCode = p0,
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListRowSummeryInCart(
                  subtotal: double.parse(price),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonApp(
                  text: 'Place Order',
                  color: maincolor,
                  colortext: maincolor2,
                  onPressed: () {
                    if (context
                        .read<CheckoutCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<CheckoutCubit>().addFormCheckout(
                          state: context.read<CheckoutCubit>().statee!,
                          city: context.read<CheckoutCubit>().city!,
                          price: price,
                          postalCode: context.read<CheckoutCubit>().postalCode!,
                          street: context.read<CheckoutCubit>().street!);

                      context.read<CheckoutCubit>().streetController.clear();
                      context.read<CheckoutCubit>().cityController.clear();
                      context.read<CheckoutCubit>().stateController.clear();
                      context
                          .read<CheckoutCubit>()
                          .postalCodeController
                          .clear();
                     
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
