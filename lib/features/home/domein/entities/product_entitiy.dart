class ProductEntitiy {
  final String id;
  final String name;
  final String price;
  final String oldprice;
  final String image;
  final String description;
  final String category;
  final int reamaining;
  final int sold;
  final List<String> sizes;
  final Map<String, dynamic> color;
  ProductEntitiy({required this.oldprice, required this.color, 
      required this.sizes,
      required this.id,
      required this.reamaining,
      required this.sold,
      required this.category,
      required this.name,
      required this.image,
      required this.description,
      required this.price});
}
