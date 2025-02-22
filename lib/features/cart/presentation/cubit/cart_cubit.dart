import 'package:audioplayers/audioplayers.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/data/repository/repository_get_cart_impli.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repository_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/add_to_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/get_cart.dart';
import 'package:flutter/services.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  String? size;
  int count = 0;
   final AudioPlayer player = AudioPlayer();
   void addToCartSound() async {
    // تشغيل الصوت
   
  try {ByteData data = await rootBundle.load("assets/sounds/cart.mp3");
    Uint8List bytes = data.buffer.asUint8List();
    await player.play(BytesSource(bytes));
   
  } catch (e) {
throw Exception(e.toString());  
}

    // إضافة المنتج إلى السلة
 }
    // تحديث الواجهة إذا كنت تستخدم Bloc أو Provider
 

  String id = CacheHelper().getData(key: 'id') ?? '';
  addtocart(
      {required String name,
      required String image,
      required String price,
      required String quantity,
      required String size,
      required String color}) {
    try {
      AddToCart(
              repositoryCart:
                  RepositoryCart(databaseConsumer: FirebaseConsumer()))
          .call(
              EntiteyCart(
                  name: name,
                  image: image,
                  price: price,
                  quantity: quantity,
                  size: size,
                  id: 'cart', color:color ),
              id);
      emit(CartSuccess());
    } on Exception catch (e) {
      emit(CartError(e.toString()));
    }
  }

  getData() async {
    try {
      
      emit(GetCartLoading());
      final data =
          await GetCart(repositroyGetCart: getIt.get<RepositoryGetCartImpli>())
              .call(CategoryParams(id: 'cart',category: ''), id);
      emit(GetCartSuccess(cart: data));
    } on Exception catch (e) {
      emit(GetCartError(e.toString()));
    }
  }
}
