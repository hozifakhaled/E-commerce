import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';

abstract class RepositroyGetCart {
  Future<Stream<List<EntiteyCart>>> getdata(CategoryParams category,String id);
}