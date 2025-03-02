import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repositroy_get_cart.dart';

class CheckItemInCart {
  final RepositroyGetCart _cartRepository;

  CheckItemInCart(this._cartRepository);

  Future<dynamic> call(String id,EntiteyCart cart) async {
    return await _cartRepository.checkIteInCart(id, cart);
  }
}