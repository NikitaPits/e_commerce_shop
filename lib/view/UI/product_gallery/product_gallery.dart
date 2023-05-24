import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:e_commerce_shop/view/UI/product_card/product_card_full_widget.dart';
import 'package:e_commerce_shop/view/UI/product_card/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductGallery extends StatelessWidget {
  final List<Product> products;

  const ProductGallery({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: products.map((product) {
          return Container(
            width: MediaQuery.of(context).size.width / 2 - 24.0,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductCardPage(
                      product: product,
                    );
                  }));
                },
                child: ProductCarousel(product: product)),
          );
        }).toList(),
      ),
    );
  }
}
