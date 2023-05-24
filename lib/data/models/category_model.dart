import 'package:e_commerce_shop/data/models/product_model.dart';

class ProductCategory {
  final String name;
  final List<Product> products;

  ProductCategory({
    required this.name,
    required this.products,
  });
}
