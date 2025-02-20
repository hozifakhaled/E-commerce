import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';

abstract class ProductRepository {
  Future<List<ProductEntitiy>> getdata(CategoryParams categoryParams);
  Future<List<ProductEntitiy>> getCategories(CategoryParams categoryParams);
    Future<void> updateReminingandSold(SoldParams soldParams);
}
