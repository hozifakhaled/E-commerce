import 'package:audioplayers/audioplayers.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/data/repository/repository_get_cart_impli.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repository_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/add_to_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/check_item_in_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/clear_data.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/delete_item.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/get_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/update_price_quantity.dart';
import 'package:flutter/services.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int count1 = 0;
  String? size;
  int count = 0;
  final AudioPlayer player = AudioPlayer();
  final List<EntiteyCart> cart = [];
  void addToCartSound() async {
    // تشغيل الصوت

    try {
      ByteData data = await rootBundle.load("assets/sounds/cart.mp3");
      Uint8List bytes = data.buffer.asUint8List();
      await player.play(BytesSource(bytes));
    } catch (e) {
      throw Exception(e.toString());
    }

    // إضافة المنتج إلى السلة
  }
  // تحديث الواجهة إذا كنت تستخدم Bloc أو Provider

  String id = CacheHelper().getData(key: 'id') ?? '';
  Future<void> addToCart({
    required String name,
    required String image,
    required String price,
    required String quantity,
    required String size,
    required String color,
  }) async {
    try {
     // emit(GetCartLoading());
      final repository = getIt.get<RepositoryGetCartImpli>();

      // ✅ تحقق مما إذا كان المنتج موجودًا بالفعل في السلة
      List<EntiteyCart> existingItems = await CheckItemInCart(repository).call(
          id,
          EntiteyCart(
            name: name,
            image: image,
            price: price,
            quantity: quantity,
            size: size,
            id: 'cart',
            color: color,
          ));

      if (existingItems.isNotEmpty) {
        // ✅ المنتج موجود، قم بتحديث السعر والكمية
        final existingItem = existingItems.first;
        final updatedPrice =
            (double.parse(existingItem.price) + double.parse(price)).toString();
        final updatedQuantity =
            (int.parse(existingItem.quantity) + int.parse(quantity)).toString();

        await UpdatePriceQuantity(
                RepositoryCart(databaseConsumer: FirebaseConsumer()))
            .call(
          existingItem.copyWith(price: updatedPrice, quantity: updatedQuantity),
          id,
          existingItem.id,
        );
      } else {
        // ✅ المنتج غير موجود، أضفه إلى السلة
        await AddToCart(
                repositoryCart:
                    RepositoryCart(databaseConsumer: FirebaseConsumer()))
            .call(
          EntiteyCart(
            name: name,
            image: image,
            price: price,
            quantity: quantity,
            size: size,
            id: 'cart',
            color: color,
          ),
          id,
        
        );
      }

      // ✅ إرسال الحالة الناجحة بعد الإضافة أو التحديث
      emit(CartSuccess());
    } catch (e) {
      emit(CartError("Failed to add item to cart: ${e.toString()}"));
    }
  }

  getData() async {
    try {
      emit(GetCartLoading());

      await GetCart(repositroyGetCart: getIt.get<RepositoryGetCartImpli>())
          .call(CategoryParams(id: 'cart', category: ''), id)
          .then((value) {
        value.listen((cartList) {
          emit(GetCartSuccess(cart: cartList));
        });
      });
    } on Exception catch (e) {
      emit(GetCartError(e.toString()));
    }
  }

  deletedata(String id2) async {
    try {
     //  emit(GetCartLoading());
      await DeleteItem( RepositoryCart(databaseConsumer: FirebaseConsumer())).call(id, id2);
    } on Exception catch (e) {final data = FirebaseFirestore.instance;
 
      await data.collection('cart').doc('hdhyfhkhaldhswkhh@gmail.com').delete();
      emit(GetCartError(e.toString()));
    }
  }

  cleardata() async {
    try {
      ClearData(getIt.get<RepositoryGetCartImpli>()).call(id);
      
   } on Exception catch (e) {
      emit(GetCartError(e.toString()));
    }
  }

  cacheid(String id) {
    CacheHelper().getDataString(key: 'id');
  }
}
