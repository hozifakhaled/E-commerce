// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/home/data/repository/product_home_repository_impli.dart';
import 'package:ecommercefirebase/features/home/domein/usecase/best_selling.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  cacheid(String value) {
    CacheHelper().saveData(key: 'id', value: value);
  }

  getBestSelling() {
    emit(BestSelingLoading());
    try {
  BestSelling(productRepository:getIt.get<ProductHomeRepositoryImpli>() ).getBestSelling().then(
      (value) => emit(BestSelingSuccess(productModelList: value)));
} on Exception catch (e) {
  BestSelingError(errorMessage: e.toString());
}
  }
}
