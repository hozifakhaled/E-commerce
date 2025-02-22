// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/categories/data/repository/product_repository_impli.dart';
import 'package:ecommercefirebase/features/categories/domein/usecase/update_remining_and_sold.dart';

part 'detaile_state.dart';

class DetaileCubit extends Cubit<DetaileState> {
  DetaileCubit() : super(DetaileInitial());
  int quantity = 0;
  double totalprice = 0;
  String size = '';
  String color = '';
  void incrementQuantity(double price, int reamaining,context) {
    if (quantity < reamaining) {
      quantity += 1;
      totalprice += price;

      emit(DetaileIcrement());
    } else {
      Helpers().alertDone(context, "Error", "Product is out of stock", null,  null, DialogType.error).show();
    }
  }

  void decrementQuantity(double price) {
    if (quantity > 0) {
      quantity -= 1;
      totalprice -= price;

      emit(Detailederement());
    }
   
  }

  void update(String id, { required int sold,required int reamaining}) {
    UpdateReminingAndSold(getIt.get<ProductRepositoryImpli>()).call(SoldParams(
      id: id,
      sold: sold,
      remaining: reamaining,
    ));
  }
}
