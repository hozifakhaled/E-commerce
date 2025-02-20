import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListColorInDetailes extends StatefulWidget {
  const ListColorInDetailes({
    super.key,
    required this.productEntitiy, required this.onSizeSelected,
  });

  final ProductEntitiy productEntitiy;
   final Function(String) onSizeSelected;

  @override
  State<ListColorInDetailes> createState() => _ListColorInDetailesState();
}

class _ListColorInDetailesState extends State<ListColorInDetailes> {
  @override
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return Container(
        height: context.height * .15,
        width: 32.h,
        decoration: BoxDecoration(
            color: maincolor2, borderRadius: BorderRadius.circular(20.r)),
        child: ListView.builder(
            itemCount: widget.productEntitiy.color.length,
            itemBuilder: (BuildContext context, int index) {
              String colorName = widget.productEntitiy.color.keys.elementAt(index);

              String colorHex = widget.productEntitiy.color[colorName];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                      setState(() {
                      String selectedSize = colorName;
                      widget.onSizeSelected(selectedSize);
                      // print('selected size: $selectedSize');
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:currentIndex==index?maincolor: Colors.transparent),
                      color: Color(int.parse(colorHex)), // ✅ تحويل Hex إلى لون
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                  ),
                ),
              );
            }));
  }
}
