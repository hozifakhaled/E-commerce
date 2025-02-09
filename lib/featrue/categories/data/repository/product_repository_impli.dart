import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_source_remote.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_sourse_local.dart';
import 'package:ecommercefirebase/featrue/categories/data/models/product_model.dart';
import 'package:ecommercefirebase/featrue/categories/domein/repository/product_repository.dart';

class ProductRepositoryImpli implements ProductRepository {
  final ProductDataSourceRemote remote;
  final NetworkInfo networkInfo;
  final ProductDataSourseLocal local;

  ProductRepositoryImpli(
      {required this.remote, required this.networkInfo, required this.local});
  @override
  Future<List<ProductModel>> getdata(CategoryParams category) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remote.getdata(category  );

        local.cacheUser(remoteUser);
        return remoteUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        final localUser = await local.getLastproduct();
        return localUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    }
  }
}
