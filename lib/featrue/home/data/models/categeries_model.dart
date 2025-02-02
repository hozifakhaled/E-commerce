import 'package:ecommercefirebase/constants/images.dart';

class CategeriesModel {
  String? name;
  String? image;

  CategeriesModel({this.name, this.image});}

  List<CategeriesModel> data = [
  CategeriesModel(name: 'Hoodie', image: Assets.imagesHoodies),
  CategeriesModel(name: 'T-shirt', image:Assets.imagesTeshartpng ),
  CategeriesModel(name: 'Shoes', image: Assets.imagesShoes),
  CategeriesModel(name: 'Accessories', image: Assets.imagesAccessorise),
  CategeriesModel(name: 'Tracksuit', image: Assets.imagesTrangs),
  CategeriesModel(name: 'Shorts', image: Assets.imagesShortspng),
  CategeriesModel(name: 'Pants', image: Assets.imagesPantalon),
  CategeriesModel(name: 'Shirt', image: Assets.imagesShmes),
  CategeriesModel(name: 'Bags', image: Assets.imagesBag),
];