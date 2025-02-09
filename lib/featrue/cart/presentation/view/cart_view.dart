import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@override
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: maincolor2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cart",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold, color: maincolor),),
            Expanded(
        
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ProductItemInCart();},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSummaryRow("Subtotal:", "\$${150}"),
                  _buildSummaryRow("Shipping:", "\$170", bold: true),
                  const Divider(),
                  _buildSummaryRow("Total:", "\$${320}", bold: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class ProductItemInCart extends StatelessWidget {
  const ProductItemInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * .15,
      decoration: BoxDecoration(
       color: maincolor2,
       border: Border(
         bottom: BorderSide(width: .5, color: Colors.grey),)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  height:70.h,
                  width: 70.w,
                 imageUrl:
                'https://qymunmwtahpiautlqlaw.supabase.co/storage/v1/object/public/mainimage//photo_2025-02-08_09-23-24-removebg-preview.png'
                         ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('name', style: const TextStyle(fontSize: 16)),
                    Text("\$150",
                        style: const TextStyle(
                            fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
                  