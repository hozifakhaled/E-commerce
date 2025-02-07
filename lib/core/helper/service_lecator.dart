import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_source_remote.dart';
import 'package:ecommercefirebase/featrue/categories/data/datasourse/product_data_sourse_local.dart';
import 'package:ecommercefirebase/featrue/categories/data/repository/product_repository_impli.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<NetworkInfoImpl>(NetworkInfoImpl(DataConnectionChecker()));
  getIt.registerSingleton<ProductDataSourseLocal>(ProductDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<ProductDataSourceRemote>(ProductDataSourceRemote(FirebaseConsumer()));
  
  getIt.registerSingleton<ProductRepositoryImpli>(ProductRepositoryImpli(remote: getIt.get<ProductDataSourceRemote>(), local: getIt.get<ProductDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));
}


