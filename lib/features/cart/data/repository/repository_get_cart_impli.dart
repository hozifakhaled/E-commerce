import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/data/datasourse/cart_data_source_remote.dart';
import 'package:ecommercefirebase/features/cart/data/datasourse/cart_data_sourse_local.dart';
import 'package:ecommercefirebase/features/cart/data/models/cart_model.dart';
import 'package:ecommercefirebase/features/cart/domain/repositories/repositroy_get_cart.dart';

class RepositoryGetCartImpli implements RepositroyGetCart {
  final CartDataSourceRemote remote;
  final NetworkInfo networkInfo;
  final CartDataSourseLocal local;

  RepositoryGetCartImpli(
      {required this.remote, required this.networkInfo, required this.local});
  @override
Future<Stream<List<CartModel>>> getdata(CategoryParams category, String id) async{
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = remote.getCartStream(category, id);

        remoteUser.first.then((remoteUserList) {
          local.cacheUser(remoteUserList);
        });
        return remoteUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        final localUser = await local.getLastproduct();
        return Stream.value(localUser);
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    }
  }
}
