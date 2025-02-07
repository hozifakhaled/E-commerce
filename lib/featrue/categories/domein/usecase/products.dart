import 'package:ecommercefirebase/featrue/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/featrue/categories/domein/repository/product_repository.dart';

class Products {
  final ProductRepository productRepository;
  Products( {required this.productRepository});

  Future<List<ProductEntitiy>> getdata() {
    return productRepository.getdata();
  }
}
