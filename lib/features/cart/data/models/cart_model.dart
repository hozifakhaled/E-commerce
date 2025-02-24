import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';

class CartModel extends EntiteyCart{
  CartModel({ required super.name, required super.price, required super.image, required super.id, required super.quantity, required super.size, required super.color});
   factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(name: json['name'] ,  price:  json['price'], image: json['image'], quantity: json['quantity'], size: json['size'], color: json['color'], id: '');

  }
  factory CartModel.fromFirestore(DocumentSnapshot doc) {
  final data = doc.data()! as Map<String, dynamic> ;
  return CartModel(
    id: doc.id, // 🔥 استخدم الـ ID من Firestore مباشرةً
    name: data['name'] ?? '',
    price: data['price'] ?? '',
    image: data['image'] ?? '',
    quantity: data['quantity'] ?? '',
    size: data['size'] ?? '',
    color: data['color'] ?? '',
  );
}
  Map<String, dynamic> toJson() {
    return {
      'size': size,
      'image': image,
      'name': name,
      'price': price,
      'id': id,
      'quantity': quantity,
      'color': color
    };
  }
}