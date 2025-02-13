
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/cart/data/repository/repository_get_cart_impli.dart';
import 'package:ecommercefirebase/featrue/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/featrue/cart/domain/repositories/repository_cart.dart';
import 'package:ecommercefirebase/featrue/cart/domain/usecases/add_to_cart.dart';
import 'package:ecommercefirebase/featrue/cart/domain/usecases/get_cart.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
    String? size  ;

    String id = CacheHelper().getData(key: 'id') ?? '';
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
          id: 'cart'),
          id);
          emit(CartSuccess());
} on Exception catch (e) {
  emit(CartError( e.toString()));
}
  }
 getData()async
 {
  try {
    emit(GetCartLoading());
 final data = await GetCart(repositroyGetCart:getIt.get<RepositoryGetCartImpli>() ).call(CategoryParams(id: 'cart'),id);
emit( GetCartSuccess(cart: data));

} on Exception catch (e) {
  emit(GetCartError(e.toString()));
  
}
 }

}
