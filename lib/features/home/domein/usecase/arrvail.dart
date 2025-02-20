import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/home/domein/repository/product_home_repository.dart';

class Arrvail {
  final ProductHomeRepository productHomeRepository;

  Arrvail(this.productHomeRepository);
  Future<List<ProductEntitiy>> call() {
    return productHomeRepository.getArrival();
  }
}
