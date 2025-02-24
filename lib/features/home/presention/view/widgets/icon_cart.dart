import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class IconCart extends StatelessWidget {
  const IconCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getData(), // ✅ بدء المتابعة تلقائيًا
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          int count = 0;
          if (state is GetCartSuccess) {
            count = state.cart.length;
          }
          return badges.Badge(
            badgeContent: Text(count.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
            child: const Icon(CupertinoIcons.shopping_cart),
          );
        },
      ),
    );
  }
}
