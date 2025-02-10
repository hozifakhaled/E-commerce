import 'package:ecommercefirebase/core/database/firebase/database_consumer.dart';
import 'package:ecommercefirebase/featrue/cart/domain/entities/entitey_cart.dart';

class RepositoryCart {
  final DatabaseConsumer databaseConsumer;

  RepositoryCart({required this.databaseConsumer});

  Future<void> adddata(EntiteyCart cart) async {
    await databaseConsumer.adddata(cart.id, {
      'id': cart.id,
      'name': cart.name,
      'price': cart.price,
      'image': cart.image,
      'quantity': cart.quantity,
      'size': cart.size,
    });
  }
}