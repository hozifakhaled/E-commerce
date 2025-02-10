import 'package:ecommercefirebase/featrue/cart/domain/entities/entitey_cart.dart';

class CartModel extends EntiteyCart{
  CartModel({ required super.name, required super.price, required super.image, required super.id, required super.quantity, required super.size});
   factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(name: json['name'] ,  price:  json['price'], image: json['image'], id: json['id'], quantity: json['quantity'], size: json['size']);

  }
  Map<String, dynamic> toJson() {
    return {
      'size': size,
      'image': image,
      'name': name,
      'price': price,
      'id': id,
      'quantity': quantity
    };
  }
}