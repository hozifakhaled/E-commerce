import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';

class ProductModel extends ProductEntitiy {
  ProductModel(
      {required super.category,
      required super.name,
      required super.price,
      required super.image,
      required super.description,
      required super.reamaining,
      required super.sold,
      required super.id,
      required super.sizes,
      required super.color, required super.oldprice});
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
      id: snapshot.id, // الـ id هيكون الـ Document ID في Firestore
      sizes: List<String>.from(data['size'] ?? []),
      color: Map<String, dynamic>.from(data['color'] ??
          {}), oldprice: data['oldprice'], // ✅ تحويل color إلى Map, // تحويل الـ size من Firestore
    );
  }

    factory ProductModel.fromjson(Map<String, dynamic> data) {
    
    return ProductModel(
      name: data['name'],
      price: data['price'],
      image: data['image'],
      description: data['description'],
      category: data['category'],
      reamaining: data['Reamaining'],
      sold: data['sold'],
      id: data['id'], // الـ id هيكون الـ Document ID في Firestore
      sizes: List<String>.from(data['size'] ?? []),
      color: Map<String, dynamic>.from(data['color'] ??
          {}), oldprice: data['oldprice'], // ✅ تحويل color إلى Map, // تحويل الـ size من Firestore
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'image': image,
      'name': name,
      'price': price,
      'category': category,
      'Reamaining': reamaining,
      'sold': sold,
      'oldprice':oldprice,
      'size': sizes, // ✅ إضافة size
      'color': color, // ✅ إضافة color
    };
  }
}
