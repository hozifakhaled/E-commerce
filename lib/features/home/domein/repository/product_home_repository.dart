import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';

abstract class ProductHomeRepository {
  Future<List<ProductEntitiy>> getBestSelling();
  Future<List<ProductEntitiy>> getArrival();
  Future<List<ProductEntitiy>> getdiscount();
}
