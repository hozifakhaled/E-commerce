import 'package:ecommercefirebase/features/checkout/domain/entities/checkout_entitiey.dart';
import 'package:ecommercefirebase/features/checkout/domain/repositories/checkout_repositry.dart';

class AddFormCheckout {
  final CheckoutRepository repository;

  AddFormCheckout(this.repository);

  Future<void> call(CheckoutEntitiey checkout,String id) async {
    return await repository.addFormCheckout(checkout, id);
  }
}