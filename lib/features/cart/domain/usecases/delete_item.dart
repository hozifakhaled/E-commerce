//import 'package:ecommercefirebase/features/cart/data/repository/repository_get_cart_impli.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repository_cart.dart';

class DeleteItem {
  final RepositoryCart _cartRepository;

  DeleteItem(this._cartRepository);

  Future<void> call(String id, String id2) async {
    return _cartRepository.deletedata(id, id2);
    
  }

  
}
