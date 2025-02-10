
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/featrue/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/featrue/cart/domain/repositories/repository_cart.dart';
import 'package:ecommercefirebase/featrue/cart/domain/usecases/add_to_cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
    String? size  ;
  addtocart(
      {required String name,
      required String image,
      required String price,
      required String quantity,
      required String size}) {
    try {
  AddToCart(
          repositoryCart:
              RepositoryCart(databaseConsumer: FirebaseConsumer()))
      .call(EntiteyCart(
          name: name,
          image: image,
          price: price,
          quantity: quantity,
          size: size,
          id: 'cart'));
          emit(CartSuccess());
} on Exception catch (e) {
  emit(CartError( e.toString()));
}
  }
}
