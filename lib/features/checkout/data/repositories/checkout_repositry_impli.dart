import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/checkout/domain/entities/checkout_entitiey.dart';
import 'package:ecommercefirebase/features/checkout/domain/repositories/checkout_repositry.dart';

class CheckoutRepositryImpli implements CheckoutRepository {
  final FirebaseConsumer firebaseConsumer;

  CheckoutRepositryImpli({required this.firebaseConsumer});
  @override
  Future<void> addFormCheckout(CheckoutEntitiey checkout, String id) async {
    {
      try {
  await firebaseConsumer.adddatadoccollection('checkout', id, {
    'name': checkout.name,
    'city': checkout.city,
    'price': checkout.price,
    'postalCode': checkout.postalCode,
    'street': checkout.street,
    'phone': checkout.phone,
  });
} on Exception catch (e) {
  throw 'no internet$e';
}
    }
  }
}
