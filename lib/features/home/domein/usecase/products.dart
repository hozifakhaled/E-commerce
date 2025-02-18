import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/categories/domein/repository/product_repository.dart';

class Products {
  final ProductRepository productRepository;
  Products( {required this.productRepository});

  Future<List<ProductEntitiy>> getdata(CategoryParams categoryParams) {
    return productRepository.getdata(categoryParams );
  }
}
