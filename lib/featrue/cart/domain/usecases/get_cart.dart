import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/featrue/cart/domain/repositories/repositroy_get_cart.dart';

class GetCart {
  final RepositroyGetCart repositroyGetCart;

  GetCart({required this.repositroyGetCart});

  Future<List<EntiteyCart>> call(CategoryParams category) async => await repositroyGetCart.getdata(category);
}