class EntiteyCart {
  final String name;
  final String image;
  final String price;
  final String quantity;
  final String size;
  final String id;
  final String color;

  EntiteyCart({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
    required this.id,
    required this.color,
  });

  // ✅ إضافة copyWith
  EntiteyCart copyWith({
    String? name,
    String? image,
    String? price,
    String? quantity,
    String? size,
    String? id,
    String? color,
  }) {
    return EntiteyCart(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      id: id ?? this.id,
      color: color ?? this.color,
    );
  }
}

