import 'package:ecommercefirebase/featrue/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/featrue/cart/domain/repositories/repository_cart.dart';

class AddToCart {
  final RepositoryCart repositoryCart;

  AddToCart({required this.repositoryCart});

  Future<void> call(EntiteyCart cart, String id) async {
    return await repositoryCart.adddata(cart, id);
  }
}