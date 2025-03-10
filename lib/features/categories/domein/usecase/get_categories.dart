import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/categories/domein/repository/product_repository.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';

class GetCategories {
  final ProductRepository productRepository;
  GetCategories({required this.productRepository});

  Future<List<ProductEntitiy>> call(CategoryParams categoryParams) =>
      productRepository.getCategories(categoryParams);
}
