import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';

abstract class RepositroyGetCart {
  Future<Stream<List<EntiteyCart>>> getdata(CategoryParams category, String id);
  Future<void> deletedata(String id, String id2);
  Future<List<EntiteyCart>> checkIteInCart(String id, EntiteyCart cart);
  Future<void> clearCart(String id);
}
