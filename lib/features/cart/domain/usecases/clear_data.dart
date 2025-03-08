import 'package:ecommercefirebase/features/cart/domain/repositories/repositroy_get_cart.dart';

class ClearData {
  final RepositroyGetCart repository;

  ClearData(this.repository);

  Future<void> call(String id) async {
    return await repository.clearCart(id);
  }
  
}