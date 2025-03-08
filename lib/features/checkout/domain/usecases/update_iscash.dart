import 'package:ecommercefirebase/features/checkout/domain/repositories/checkout_repositry.dart';

class UpdateIscash {
  final CheckoutRepository checkoutRepositry;
  UpdateIscash(this.checkoutRepositry);
  Future<void> call(bool iscash,String id,String id2) async {
    return await checkoutRepositry.updatecash(iscash, id,id2);
  }
}