import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/size_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListSize extends StatefulWidget {
  const ListSize({
    super.key,
    required this.onSizeSelected, required this.list,
  });
  final List<String> list;
  final Function(String) onSizeSelected;

  @override
  State<ListSize> createState() => _ListSizeState();
}

class _ListSizeState extends State<ListSize> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size ',
          style: Textstyles.textfeatruecategory
              .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length ,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      String selectedSize = widget.list[index];
                      widget.onSizeSelected(selectedSize);
                      // print('selected size: $selectedSize');
                      indexSelected = index;
                    });
                  },
                  child: SizeItem(
                    text: widget.list[index],
                    color: indexSelected == index ? maincolor : Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
