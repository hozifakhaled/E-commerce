import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class IconCart extends StatelessWidget {
  const IconCart({super.key});

  
 // عدد المنتجات في السلة
  @override
  Widget build(BuildContext context) {
   
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        
        if (state is GetCartSuccess) {
         
            context.read<CartCubit>().count = state.cart.length; // تحديث العدد تلقائيًا
       
        }
      },
      builder: (context, state) {
          if (state is GetCartSuccess) {
  return badges.Badge(
    showBadge:state.cart.length>0 ? true : false,
    badgeContent: Text(
      state.cart.length.toString(),
      style: const TextStyle(color: Colors.white),
    ),
    child: Icon(CupertinoIcons.shopping_cart),
  );
}else{return badges.Badge(
  showBadge: false,
    badgeContent: Text(
      0.toString(),
      style: const TextStyle(color: Colors.white),
    ),
    child: Icon(CupertinoIcons.shopping_cart),
  );}
        }
      );
  }
}
