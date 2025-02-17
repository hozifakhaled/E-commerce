import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/categories/domein/repository/product_repository.dart';

class UpdateReminingAndSold {
  final ProductRepository repository;
  UpdateReminingAndSold(this.repository);

  Future<void> call(SoldParams categoryParams) {
    return repository.updateReminingandSold(categoryParams);
  }
}
