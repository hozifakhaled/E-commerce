// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/home/data/repository/product_home_repository_impli.dart';
import 'package:ecommercefirebase/features/home/domein/usecase/arrvail.dart';
import 'package:ecommercefirebase/features/home/domein/usecase/discount.dart';

part 'arrvail_state.dart';

class ArrvailCubit extends Cubit<ArrvailState> {
  ArrvailCubit() : super(ArrvailInitial());

  getArrvail() {
    emit(ArrvailLoading());
    try {
      Arrvail(getIt.get<ProductHomeRepositoryImpli>())
          .call()
          .then((value) => emit(ArrvailSuccess(productModelList: value)));
    } on Exception catch (e) {
      ArrvailError(errorMessage: e.toString());
    }
  }

  getDiscount() {
    emit(ArrvailLoading());
    try {
      Discount(productRepository: getIt.get<ProductHomeRepositoryImpli>())
          .call()
          .then((value) => emit(ArrvailSuccess(productModelList: value)));
    } on Exception catch (e) {
      ArrvailError(errorMessage: e.toString());
    }
  }
}
