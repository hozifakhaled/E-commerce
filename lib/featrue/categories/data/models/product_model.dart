import 'package:ecommercefirebase/featrue/categories/domein/entities/product_entitiy.dart';

class ProductModel extends ProductEntitiy{
  ProductModel({required super.name, required super.price, required super.image, required super.description});
   factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(name: json['name'] ,  price:  json['price'], image: json['image'], description: json['description']);

  }
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image': image,
      'name': name,
      'price': price,
    };
  }
}