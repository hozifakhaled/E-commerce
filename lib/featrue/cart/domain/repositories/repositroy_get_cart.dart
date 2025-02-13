import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/cart/domain/entities/entitey_cart.dart';

abstract class RepositroyGetCart {
  Future<List<EntiteyCart>> getdata(CategoryParams category,String id);
}