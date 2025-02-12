import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/button_add_to_cart.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/list_size.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/row_name_and_quantity.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/row_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionContinerInHome extends StatefulWidget {
  const SectionContinerInHome({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });
  final String name;
  final String description;
  final String price;
  final String category;
  final String image;

  @override

  //  super.initState();

  @override
  State<SectionContinerInHome> createState() => _SectionContinerInHomeState();
}

class _SectionContinerInHomeState extends State<SectionContinerInHome> {
  int quantitynumber = 0;
  String? formattedPrice;
  double totalprice = 0;
  String size = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: context.height * 0.53,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              RowNameAndQuantity(
                name: widget.name,
                price: double.parse(widget.price),
                quantitynumber: quantitynumber,
                onPresseddecrement: () {
                  setState(() {
                    if (quantitynumber > 0) {
                      quantitynumber -= 1;

                      totalprice = totalprice - double.parse(widget.price);
                      formattedPrice = totalprice.toStringAsFixed(2);
                    }
                  });
                },
                onPressedincrement: () {
                  setState(() {
                    quantitynumber += 1;
                    totalprice = totalprice + double.parse(widget.price);
                    formattedPrice = totalprice.toStringAsFixed(2);
                  });
                },
              ),
              RowRating(),
              widget.category == 'shoes'
                  ? ListSize(
                      isshoes: true,
                      onSizeSelected: (p0) {
                        size = p0;
                      },
                    )
                  : widget.category == 'clothes'
                      ? ListSize(
                          isshoes: false,
                          onSizeSelected: (p0) {
                            size = p0;
                          },
                        )
                      : SizedBox(),
              Text(
                'Description ',
                style: Textstyles.textfeatruecategory
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Textstyles.text2otp.copyWith(fontSize: 13.sp),
              ),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(
                  width: context.width * .3,
                  child: Text(
                    '\$${totalprice.toStringAsFixed(2)} ',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BlocProvider(
                  create: (context) => CartCubit(),
                  child: ButtonAddToCart(
                    size: size,
                      widget: widget,
                      totalprice: totalprice,
                      quantitynumber: quantitynumber),
                )
              ])
            ],
          ),
        ));
  }
}
