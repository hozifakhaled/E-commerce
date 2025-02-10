import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/view/widgets/list_row_summery_in_cart.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/view/widgets/product_item_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@override
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getData(),
      child: Scaffold(
        backgroundColor: maincolor2,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is GetCartSuccess) {
                double totalPrice = state.cart
                    .fold(0, (sum, item) => sum + (double.parse(item.price)));

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height * .3,
                      child: ListView.builder(
                        itemCount: state.cart.length,
                        itemBuilder: (context, index) {
                          return ProductItemInCart(
                            name: state.cart[index].name,
                            size: state.cart[index].size,
                            quntity: state.cart[index].quantity,
                            image: state.cart[index].image,
                            price: state.cart[index].price,
                          );
                        },
                      ),
                    ),
                    ListRowSummeryInCart(
                      Subtotal: totalPrice,
                    ),
                    buttonApp(
                        text: 'Checkout',
                        color: maincolor,
                        colortext: maincolor2)
                  ],
                );
              } else if (state is GetCartError) {
                return Center(child: Text(state.message));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
