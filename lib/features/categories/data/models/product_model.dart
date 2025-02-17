import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/features/categories/domein/entities/product_entitiy.dart';

class ProductModel extends ProductEntitiy {
  ProductModel(
      {required super.category,
      required super.name,
      required super.price,
      required super.image,
      required super.description,
      required super.reamaining,
      required super.sold, required super.id, required super.sizes});
   factory ProductModel.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
      name: data['name'],
      price: data['price'],
      image: data['image'],
      description: data['description'],
      category: data['category'],
      reamaining: data['Reamaining'],
      sold: data['sold'],
      id: snapshot.id,// الـ id هيكون الـ Document ID في Firestore
        sizes: List<String>.from(data['size'] ?? []), // تحويل الـ size من Firestore
    );
  }  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'image': image,
      'name': name,
      'price': price,
      'category': category,
      'Reamaining': reamaining,
      'sold': sold
    };
  }
}
