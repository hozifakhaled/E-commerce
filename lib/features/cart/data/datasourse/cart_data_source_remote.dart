import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/data/models/cart_model.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';

class CartDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  CartDataSourceRemote(this.firebaseConsumer);
  Stream<List<CartModel>> getCartStream(CategoryParams category, String id) {
    return firebaseConsumer
        .getdatadoccollection(category.id, id)
        .map((snapshot) {
      return snapshot.docs.map((doc) => CartModel.fromFirestore(doc)).toList();
    });
  }

  Future<List<CartModel>> checkIteInCart(String id, EntiteyCart cart) async {
    List<CartModel> list = [];
    final snapshot = await firebaseConsumer.getDataInCollectionFilterNotequal(
        'cart', 'name', cart.name, 'size', cart.size, 'color', cart.color, id);
    for (var doc in snapshot.docs) {
      list.add(CartModel.fromFirestore(doc));
    }
    return list;
  }
}
