import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/home/domein/repository/product_home_repository.dart';

class BestSelling {
  final ProductHomeRepository productRepository;
  BestSelling( {required this.productRepository});

  Future<List<ProductEntitiy>> getBestSelling() {
    return productRepository.getBestSelling();
  }
}
