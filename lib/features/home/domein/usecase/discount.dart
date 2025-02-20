import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/home/domein/repository/product_home_repository.dart';

class Discount {
  final ProductHomeRepository productRepository;
  Discount({required this.productRepository});

  Future<List<ProductEntitiy>> call()async {
    return await productRepository.getdiscount();
  }
}
