import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/categories/domein/entities/product_entitiy.dart';

abstract class ProductRepository {
  Future<List<ProductEntitiy>> getdata(CategoryParams categoryParams);
}
