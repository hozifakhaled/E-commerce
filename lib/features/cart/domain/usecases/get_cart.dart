import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repositroy_get_cart.dart';

class GetCart {
  final RepositroyGetCart repositroyGetCart;

  GetCart({required this.repositroyGetCart});

  Future<List<EntiteyCart>> call(CategoryParams category,String id) async => await repositroyGetCart.getdata(category,id);
}