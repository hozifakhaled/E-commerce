import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';

class CartLengthCubit extends Cubit<int> {
  CartLengthCubit() : super(0);

  void listenToCart() {
    String? userId = CacheHelper().getDataString(key: 'id');

    FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('cart')
        .snapshots()
        .listen((snapshot) {
      emit(snapshot.docs.length); // ✅ تحديث العدد عند كل تغيير
    });
  }
}
