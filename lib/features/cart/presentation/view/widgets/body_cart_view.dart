import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/list_row_summery_in_cart.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/product_item_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BodyCartview extends StatelessWidget {
  const BodyCartview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartSuccess) {
            //print(state.cart[0].id);
            double totalPrice = state.cart
                .fold(0, (sum, item) => sum + (double.parse(item.price)));
    
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('You have ${state.cart.length} items',style: Textstyles.text16,),
                            SizedBox(
                  height: context.height * .3,
                  child: ListView.builder(
                    itemCount: state.cart.length,
                    itemBuilder: (context, index) {
                      return ProductItemInCart(
                        cart: state.cart[index],
                      );
                    },
                  ),
                ),
                ListRowSummeryInCart(
                  subtotal: totalPrice,
                ),
                ButtonApp(
                    text: 'Checkout',
                    color: maincolor,
                    colortext: maincolor2,
                    onPressed: () => GoRouter.of(context).push(AppRoutes.checkout),
                    ),

              ],
            );
          } else if (state is GetCartError) {
            return Center(child: Text('No Data'));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
