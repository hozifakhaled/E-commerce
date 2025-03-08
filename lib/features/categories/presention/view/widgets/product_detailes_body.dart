import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/detailes_cubit/detaile_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/scetion_container_in_detailes.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailesBody extends StatelessWidget {
  const ProductDetailesBody({
    super.key,
    required this.productEntitiy, required this.index,
  });
  final ProductEntitiy productEntitiy;
  final int index ;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          // width: double.infinity,
          child: Hero(
            tag: productEntitiy.image + index.toString(),
            child: CachedNetworkImage(
              //width: context.width * .5,
              height: context.height * 0.4,
              fit: BoxFit.cover,
              imageUrl: productEntitiy.image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
      BlocProvider(
        create: (context) => DetaileCubit(),
        child: SectionContinerInDetailes(productEntitiy: productEntitiy),
      )
    ]);
  }
}
