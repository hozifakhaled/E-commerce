import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/view/widgets/sammary_row_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListRowSummeryInCart extends StatelessWidget {
  const ListRowSummeryInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                label: "Subtotal:", value: "\$${150}", bold: true),
            SammaryRowInCart(
                label: "Shipping:", value: "\$170", bold: true),
            const Divider(),
            SammaryRowInCart(
                label: "Total:", value: "\$${320}", bold: true),
          ],
        ),
      ),
    );
  }
}
