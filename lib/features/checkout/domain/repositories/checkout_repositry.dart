import 'package:ecommercefirebase/features/checkout/domain/entities/checkout_entitiey.dart';

abstract class CheckoutRepository {
  Future<void> addFormCheckout(
      CheckoutEntitiey checkout, String id, String id2);
  Future<void> updatecash(bool iscash, String id, String id2);
}
