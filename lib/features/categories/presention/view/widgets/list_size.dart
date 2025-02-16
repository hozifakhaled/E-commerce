import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/size_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListSize extends StatefulWidget {
  const ListSize({
    super.key,
    required this.isshoes, required this.onSizeSelected,
  });
  final bool isshoes;
   final Function(String) onSizeSelected;

  @override
  State<ListSize> createState() => _ListSizeState();
}

class _ListSizeState extends State<ListSize> {
  int indexSelected = 0;
  List<String> list = ['S', 'M', 'L', 'XL', 'XXL'];
  List<String> size = [
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46'
  ];

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
            itemCount: widget.isshoes ? size.length : list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                   String selectedSize =  list[index];
                    widget.onSizeSelected(selectedSize);
                   // print('selected size: $selectedSize');
                     indexSelected = index;

                    });
                  },
                  child: SizeItem(
                    text: widget.isshoes ? size[index] : list[index],
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
