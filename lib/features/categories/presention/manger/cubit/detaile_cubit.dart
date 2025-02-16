// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'detaile_state.dart';

class DetaileCubit extends Cubit<DetaileState> {
  DetaileCubit() : super(DetaileInitial());
  int quantity = 0;
  double totalprice = 0;
  String size = '';
  void incrementQuantity(double price) {
    quantity += 1;
    totalprice += price;
    /* totalprice = totalprice + double.parse(widget.price);
                    formattedPrice = totalprice.toStringAsFixed(2);*/
    emit(DetaileIcrement());
  }

  void decrementQuantity(double price) {
    if (quantity > 0) {
      quantity -= 1;
      totalprice -= price;
        emit(Detailederement());
    }
  }
}
