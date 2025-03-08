import 'package:ecommercefirebase/constants/images.dart';

class CategeriesModel {
  String? name;
  String? image;
  String? id;

  CategeriesModel({this.name, this.image, this.id});}

  List<CategeriesModel> data = [
   CategeriesModel(name: 'All', image: Assets.imagesTeshartpng,id :'All'),
  CategeriesModel(name: 'Hoodie', image: Assets.imagesHoodies,id :'hoodie'),
  CategeriesModel(name: 'Jacket', image:Assets.imagesTrangs ,id: 'jacket'),
  CategeriesModel(name: 'Shoes', image: Assets.imagesShoes,id: 'shoes'),
  CategeriesModel(name: 'Accessories', image: Assets.imagesAccessorise,id: 'accessories'),
  CategeriesModel(name: 'Shorts', image: Assets.imagesShortspng,id: 'short'),
  CategeriesModel(name: 'Pants', image: Assets.imagesPantalon,id: 'pants'),
 ];

 List<CategeriesModel> data2 = [
   
    CategeriesModel(name: 'Hoodie', image: Assets.imagesHoodies,id :'hoodie'),
  CategeriesModel(name: 'T-shirt', image:Assets.imagesTeshartpng ,id: 'shirt'),
  CategeriesModel(name: 'Shoes', image: Assets.imagesShoes,id: 'shoes'),
  CategeriesModel(name: 'Accessories', image: Assets.imagesAccessorise,id: 'accessories'),
  CategeriesModel(name: 'Shemise', image: Assets.imagesShmes,id: 'shemise'),
  CategeriesModel(name: 'Shorts', image: Assets.imagesShortspng,id: 'short'),
  CategeriesModel(name: 'Pants', image: Assets.imagesPantalon,id: 'pants'),];