import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/home/data/datasourse/product_home_data_source_remote.dart';
import 'package:ecommercefirebase/features/home/data/datasourse/product_home_data_sourse_local.dart';
import 'package:ecommercefirebase/features/home/data/models/product_model.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/home/domein/repository/product_home_repository.dart';

class ProductHomeRepositoryImpli implements ProductHomeRepository {
  final FirebaseConsumer firebaseConsumer;
  final ProductHomeDataSourceRemote remote;
  final NetworkInfo networkInfo;
  final ProductHomeDataSourseLocal local;

  ProductHomeRepositoryImpli(this.firebaseConsumer, 
      {required this.remote, required this.networkInfo, required this.local});
  @override
  Future<List<ProductModel>> getBestSelling() async {
    if (await networkInfo.isConnected!) {
      try {
        final remotebestselling = await remote.getBestSelling();

        local.cacheBestSelling(remotebestselling, 'bestselling');
        return remotebestselling;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        final localUser = await local.getLastBestSelling('bestselling');
        return localUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<List<ProductEntitiy>> getArrival()async {
     if (await networkInfo.isConnected!) {
    try {
        final remoteUser = await remote.getArrival();

        local.cacheBestSelling(remoteUser, 'arrival');
        return remoteUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        final localUser = await local.getLastBestSelling('arrival');
        return localUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
      }
    }
    
      @override

      Future<List<ProductEntitiy>> getdiscount() async {
     if (await networkInfo.isConnected!) {
    try {
        final remoteUser = await remote.getdiscont();

        local.cacheBestSelling(remoteUser, 'discont');
        return remoteUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        final localUser = await local.getLastBestSelling('discont');
        return localUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
      }
    
      }
  
  

  
  }

