import 'package:ecommercefirebase/constants/images.dart';

class CategeriesModel {
  String? name;
  String? image;
  String? id;

  CategeriesModel({this.name, this.image, this.id});}

  List<CategeriesModel> data = [
   CategeriesModel(name: 'All', image: Assets.imagesTrangs,id :'All'),
  CategeriesModel(name: 'Hoodie', image: Assets.imagesHoodies,id :'hoodie'),
  CategeriesModel(name: 'T-shirt', image:Assets.imagesTeshartpng ,id: 'shirt'),
  CategeriesModel(name: 'Shoes', image: Assets.imagesShoes,id: 'shoes'),
  CategeriesModel(name: 'Accessories', image: Assets.imagesAccessorise,id: 'accessories'),
  CategeriesModel(name: 'Shemise', image: Assets.imagesShmes,id: 'shemise'),
  CategeriesModel(name: 'Shorts', image: Assets.imagesShortspng,id: 'short'),
  CategeriesModel(name: 'Pants', image: Assets.imagesPantalon,id: 'pants'),
 ];

 List<CategeriesModel> data2 = [
   
  CategeriesModel(name: 'Ralph Lauren ', image: Assets.imagesHoodies,id :'hoodie'),
  CategeriesModel(name: 'Hugo Boss ', image:Assets.imagesTeshartpng ,id: 'shirt'),
  CategeriesModel(name: 'Tom Ford ', image: Assets.imagesShoes,id: 'shoes'),
  CategeriesModel(name: 'Brooks Brothers', image: Assets.imagesAccessorise,id: 'accessories'),
  CategeriesModel(name: 'Brioni ', image: Assets.imagesShmes,id: 'shemise'),
  CategeriesModel(name: 'Carhartt ', image: Assets.imagesShortspng,id: 'short'),
  CategeriesModel(name: 'Allen Edmonds', image: Assets.imagesPantalon,id: 'pants'),
  CategeriesModel(name: 'Red Wing', image: Assets.imagesPantalon,id: 'pants'),
  CategeriesModel(name: 'Salvatore Ferragamo', image: Assets.imagesPantalon,id: 'pants'),
  CategeriesModel(name: 'Montblanc ', image: Assets.imagesPantalon,id: 'pants'),
  CategeriesModel(name: 'Giorgio Armani', image: Assets.imagesPantalon,id: 'pants'),
 ];