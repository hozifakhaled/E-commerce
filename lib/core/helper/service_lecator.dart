import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/cart/data/datasourse/cart_data_source_remote.dart';
import 'package:ecommercefirebase/features/cart/data/datasourse/cart_data_sourse_local.dart';
import 'package:ecommercefirebase/features/cart/data/repository/repository_get_cart_impli.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/categories/data/datasourse/product_data_source_remote.dart';
import 'package:ecommercefirebase/features/categories/data/datasourse/product_data_sourse_local.dart';
import 'package:ecommercefirebase/features/categories/data/repository/product_repository_impli.dart';
import 'package:ecommercefirebase/features/comments/data/datasources/comment_data_source_remote.dart';
import 'package:ecommercefirebase/features/comments/data/datasources/comment_data_sourse_local.dart';
import 'package:ecommercefirebase/features/comments/data/repositories/comment_reopsitory_impli.dart';
import 'package:ecommercefirebase/features/home/data/datasourse/product_home_data_source_remote.dart';
import 'package:ecommercefirebase/features/home/data/datasourse/product_home_data_sourse_local.dart';
import 'package:ecommercefirebase/features/home/data/repository/product_home_repository_impli.dart';
import 'package:ecommercefirebase/features/profile/data/datasourse/profile_data_source_remote.dart';
import 'package:ecommercefirebase/features/profile/data/datasourse/profile_data_sourse_local.dart';
import 'package:ecommercefirebase/features/profile/data/repository/profile_repository_impli.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  getIt.registerSingleton<NetworkInfoImpl>(NetworkInfoImpl(DataConnectionChecker()));
  getIt.registerSingleton<ProductDataSourseLocal>(ProductDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<ProductDataSourceRemote>(ProductDataSourceRemote(FirebaseConsumer()));
   getIt.registerSingleton<ProductHomeDataSourseLocal>(ProductHomeDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<ProductHomeDataSourceRemote>(ProductHomeDataSourceRemote(FirebaseConsumer()));
  
  getIt.registerSingleton<CartDataSourseLocal>(CartDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<CartDataSourceRemote>(CartDataSourceRemote(FirebaseConsumer()));
  getIt.registerSingleton<ProfileDataSourseLocal>(ProfileDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<ProFileDataSourceRemote>(ProFileDataSourceRemote(FirebaseConsumer()));
    getIt.registerSingleton<CommentDataSourseLocal>(CommentDataSourseLocal(cache: CacheHelper()));
  getIt.registerSingleton<CommentsDataSourceRemote>(CommentsDataSourceRemote(FirebaseConsumer()));
   getIt.registerSingleton<CommentReopsitoryImpli>(CommentReopsitoryImpli(firebaseConsumer: FirebaseConsumer(),remote: getIt.get<CommentsDataSourceRemote>(), local: getIt.get<CommentDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));
 
    getIt.registerSingleton<ProfileRepositoryImpli>(ProfileRepositoryImpli(FirebaseConsumer(),remote: getIt.get<ProFileDataSourceRemote>(), local: getIt.get<ProfileDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));
 
  getIt.registerSingleton<ProductRepositoryImpli>(ProductRepositoryImpli(FirebaseConsumer(),remote: getIt.get<ProductDataSourceRemote>(), local: getIt.get<ProductDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));
  getIt.registerSingleton<ProductHomeRepositoryImpli>(ProductHomeRepositoryImpli(FirebaseConsumer(),remote: getIt.get<ProductHomeDataSourceRemote>(), local: getIt.get<ProductHomeDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));
 
 getIt.registerSingleton<RepositoryGetCartImpli>(RepositoryGetCartImpli( remote : getIt.get<CartDataSourceRemote>(), local: getIt.get<CartDataSourseLocal>(), networkInfo: getIt.get<NetworkInfoImpl>(),));


}


