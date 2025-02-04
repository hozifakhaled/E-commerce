import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.37,
      width: double.infinity,
      color: maincolor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Feature Product',
                style: Textstyles.textfeatruecategory
                    .copyWith(color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // عدد العناصر
                itemBuilder: (context, index) {
                  return const ProductItem(
                    desc: 'mmmm',
                    price: '120',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

