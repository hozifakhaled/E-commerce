import 'package:ecommercefirebase/core/database/firebase/database_consumer.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';

class RepositoryCart {
  final DatabaseConsumer databaseConsumer;

  RepositoryCart({required this.databaseConsumer});

  Future<void> adddata(EntiteyCart cart, String id) async {
    await databaseConsumer.adddatadoccollection('cart',id ,{
      'id': cart.id,
      'name': cart.name,
      'color': cart.color,
      'price': cart.price,
      'image': cart.image,
      'quantity': cart.quantity,
      'size': cart.size,
    });
  }

  Future<void> deletedata(String id, String id2) async {
    await databaseConsumer.deletedocincollection('cart', id,id2);
  }
}