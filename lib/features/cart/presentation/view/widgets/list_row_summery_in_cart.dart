import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/sammary_row_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListRowSummeryInCart extends StatelessWidget {
  const ListRowSummeryInCart({
    super.key, required this.subtotal,
  });
final double subtotal;
  @override
  Widget build(BuildContext context) {
    String subtotalString = subtotal.toStringAsFixed(2);
    String shoppingString = (subtotal*0.17).toStringAsFixed(2);
    String totalString = (subtotal + double.parse(shoppingString)).toStringAsFixed(2);
    return Container(
      width: context.width,
      //height: context.height * .2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10.h,
          children: [
            SammaryRowInCart(
                label: "Subtotal:", value: "\$$subtotalString", bold: true),
            SammaryRowInCart(
                label: "Shipping:", value: "\$$shoppingString", bold: true),
            const Divider(),
            SammaryRowInCart(
                label: "Total:", value: "\$$totalString", bold: true),
          ],
        ),
      ),
    );
  }
}
