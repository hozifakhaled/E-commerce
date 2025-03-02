import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repository_cart.dart';

class UpdatePriceQuantity {
  final RepositoryCart _cartRepository;

  UpdatePriceQuantity(this._cartRepository);

  Future<void> call(EntiteyCart cart, String id, String id2) async {
    return await _cartRepository.updatedata(cart, id, id2);
  }
}