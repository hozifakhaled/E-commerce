import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/home/presention/cubit/bestsellingcubit/home_cubit.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/loading_best_selling.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                'Best Selling',
                style: Textstyles.text20
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is BestSelingSuccess) {
                return Expanded(
               
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.productModelList.length, // عدد العناصر
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).push('/details', extra: {
                            'productEntitiy': state.productModelList[index],
                            'index': index
                          });
                        },
                        child: ProductItem(
                          index: index,
                          name: state.productModelList[index].name,
                          price: state.productModelList[index].price,
                          image: state.productModelList[index].image, oldprice:state.productModelList[index].oldprice ,
                        ),
                      );
                    },
                  ),
                );
              } else if (state is BestSelingError) {
                return SliverToBoxAdapter(
                  child: Text(state.errorMessage),
                );
              } else {
                return Expanded(child: LoadingBestSelling(),);
              }
            }),
          ],
        ),
      ),
    );
  }
}
