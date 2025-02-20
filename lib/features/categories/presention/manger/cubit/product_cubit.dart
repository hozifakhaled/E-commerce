// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/categories/data/repository/product_repository_impli.dart';
import 'package:ecommercefirebase/features/categories/domein/usecase/get_categories.dart';
import 'package:ecommercefirebase/features/categories/domein/usecase/products.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
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
      ).getdata(CategoryParams(id: id,category: ''));
      emit(ProductLoaded(data: data));
    } on Exception catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
    }
  }


  getCategory(String category) async {
    emit(ProductLoading());

    try {
      final data = await GetCategories(
       productRepository: getIt.get<ProductRepositoryImpli>() ,
      ).call(CategoryParams(id:'product',category:category ));
      emit(ProductLoaded(data: data));
    } on Exception catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
    }
  }
}
