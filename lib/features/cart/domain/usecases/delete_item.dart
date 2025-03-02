import 'package:ecommercefirebase/features/cart/data/repository/repository_get_cart_impli.dart';

class DeleteItem {
  final RepositoryGetCartImpli _cartRepository;

  DeleteItem(this._cartRepository);

  Future<void> call(String id, String id2) async {
    return _cartRepository.deletedata(id, id2);
    
  }
}
