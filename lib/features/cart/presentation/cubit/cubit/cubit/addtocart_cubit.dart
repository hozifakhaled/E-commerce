import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repository_cart.dart';
import 'package:ecommercefirebase/features/cart/domain/usecases/add_to_cart.dart';
import 'package:equatable/equatable.dart';

part 'addtocart_state.dart';

class AddtocartCubit extends Cubit<AddtocartState> {
  AddtocartCubit() : super(AddtocartInitial());
String id = CacheHelper().getData(key: 'id') ?? '';
  addtocart(
      {required String iddoc,
        required String name,
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
      emit(CartSuccesss());
    } on Exception catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
