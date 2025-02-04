import 'package:ecommercefirebase/featrue/categories/domein/entities/product_entitiy.dart';

class ProductModel extends ProductEntitiy{
  ProductModel({required super.dosc, required super.price});
   factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(dosc: json['docs'] ,  price:  json['price']);

  }
  Map<String, dynamic> toJson() {
    return {
      'docs': dosc,
      'price': price,
    };
  }
}