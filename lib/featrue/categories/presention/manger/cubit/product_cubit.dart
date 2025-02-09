// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/categories/data/repository/product_repository_impli.dart';
import 'package:ecommercefirebase/featrue/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/featrue/categories/domein/usecase/products.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  getdata(String id) async {
    emit(ProductLoading());

    try {
      final data = await Products(
        productRepository: getIt.get<ProductRepositoryImpli>(),
      ).getdata(CategoryParams(id: id));
      emit(ProductLoaded(data: data));
    } on Exception catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
    }
  }
}
