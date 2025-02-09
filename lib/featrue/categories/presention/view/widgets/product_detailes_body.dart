import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/scetion_container_in_detailes.dart';
import 'package:flutter/material.dart';

class ProductDetailesBody extends StatelessWidget {
  const ProductDetailesBody({super.key, required this.image, required this.name, required this.price, required this.description, required this.category});
  final String image;
  final String name;
  final String price;
  final String description;
final String category;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top:  8.0),
          child: SizedBox(
           // width: double.infinity,
            child: CachedNetworkImage(
              
              width: context.width*.5,
              height: context.height * 0.4,
              fit: BoxFit.cover,
              imageUrl:image,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        SectionContinerInHome(name: name, price: price, description: description, category: category,)
      ]),
    );
  }
}

