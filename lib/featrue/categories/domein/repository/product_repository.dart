import 'package:ecommercefirebase/featrue/categories/domein/entities/product_entitiy.dart';

abstract class ProductRepository {
  Future<List<ProductEntitiy>> getdata();
}
