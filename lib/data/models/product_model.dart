class Product {
  List<String>? images;
  String name;
  double price;
  String description;
  bool available;
  int? quantity;
  Product({
    this.images,
    required this.name,
    required this.price,
    required this.description,
    required this.available,
    this.quantity,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      available: json['available'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'images': images,
      'name': name,
      'price': price,
      'description': description,
      'available': available,
      'quantity': quantity,
    };
  }
}
