import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/data/models/cart_model.dart';

class CartDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  CartDataSourceRemote(this.firebaseConsumer);
  Stream<List<CartModel>> getCartStream(CategoryParams category, String id) {
    return firebaseConsumer
        .getdatadoccollection(category.id, id)
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => CartModel.fromFirestore(doc))
          .toList();
    });
  }
}
