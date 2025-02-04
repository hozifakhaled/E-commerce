// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_source_remote.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_sourse_local.dart';
import 'package:ecommercefirebase/featrue/categories/data/repository/product_repository_impli.dart';
import 'package:ecommercefirebase/featrue/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/featrue/categories/domein/usecase/products.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  getdata() async {
    emit(ProductLoading());

    try {
      final data = await Products(
          productRepository: ProductRepositoryImpli(
        remote: ProductDataSourceRemote(FirebaseConsumer()),
        local: ProductDataSourseLocal(cache: CacheHelper()),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      )).getdata();
      emit(ProductLoaded(data: data));
    } on Exception catch (e) {
     emit(ProductFailure(errorMessage: e.toString()));
    }
  }
}
