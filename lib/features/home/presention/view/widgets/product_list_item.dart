import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.39,
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
                    name: 'mmmm',
                    price: '120', image: 'https://qymunmwtahpiautlqlaw.supabase.co/storage/v1/object/public/mainimage//photo_2025-02-08_09-23-24-removebg-preview.png',
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

