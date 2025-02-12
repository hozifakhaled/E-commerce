import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/featrue/cart/data/datasourse/cart_data_source_remote.dart';
import 'package:ecommercefirebase/featrue/cart/data/datasourse/cart_data_sourse_local.dart';
import 'package:ecommercefirebase/featrue/cart/data/repository/repository_get_cart_impli.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_source_remote.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_sourse_local.dart';
import 'package:ecommercefirebase/featrue/categories/data/repository/product_repository_impli.dart';
import 'package:ecommercefirebase/featrue/profile/data/datasourse/profile_data_source_remote.dart';
import 'package:ecommercefirebase/featrue/profile/data/datasourse/profile_data_sourse_local.dart';
import 'package:ecommercefirebase/featrue/profile/data/repository/profile_repository_impli.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<NetworkInfoImpl>(NetworkInfoImpl(DataConnectionChecker()));
  getIt.registerSingleton<ProductDataSourseLocal>(ProductDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<ProductDataSourceRemote>(ProductDataSourceRemote(FirebaseConsumer()));
  getIt.registerSingleton<CartDataSourseLocal>(CartDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<CartDataSourceRemote>(CartDataSourceRemote(FirebaseConsumer()));
  getIt.registerSingleton<ProfileDataSourseLocal>(ProfileDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<ProFileDataSourceRemote>(ProFileDataSourceRemote(FirebaseConsumer()));
    getIt.registerSingleton<ProfileRepositoryImpli>(ProfileRepositoryImpli(remote: getIt.get<ProFileDataSourceRemote>(), local: getIt.get<ProfileDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));
 
  getIt.registerSingleton<ProductRepositoryImpli>(ProductRepositoryImpli(remote: getIt.get<ProductDataSourceRemote>(), local: getIt.get<ProductDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));
 getIt.registerSingleton<RepositoryGetCartImpli>(RepositoryGetCartImpli( remote : getIt.get<CartDataSourceRemote>(), local: getIt.get<CartDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));


}


