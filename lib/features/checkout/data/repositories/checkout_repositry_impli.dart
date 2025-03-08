import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/checkout/domain/entities/checkout_entitiey.dart';
import 'package:ecommercefirebase/features/checkout/domain/repositories/checkout_repositry.dart';

class CheckoutRepositryImpli implements CheckoutRepository {
  final FirebaseConsumer firebaseConsumer;

  CheckoutRepositryImpli({required this.firebaseConsumer});
  @override
  Future<void> addFormCheckout(CheckoutEntitiey checkout, String id, String id2) async {
    {
      try {
  await firebaseConsumer.adddatadoccollectionnamdoc('checkout', id, id2,{
    'state': checkout.state,
    'city': checkout.city,
    'price': checkout.price,
    'postalCode': checkout.postalCode,
    'street': checkout.street,
    'email': checkout.email,
    'iscash':checkout.iscash
  });
} on Exception catch (e) {
  throw 'no internet$e';
}
    }
  }
  
  @override
  Future<void> updatecash(bool iscash, String id, String id2) async{
      try {
  await firebaseConsumer.updatedatadoccollection('checkout', id, id2,{
   
    'iscash':iscash
  });
} on Exception catch (e) {
  throw 'no internet$e';
}
  }
}
