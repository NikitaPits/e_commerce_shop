import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final Product product;

  const ProductCarousel({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: product.images!.map((image) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.network(image, fit: BoxFit.cover),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Ціна: \$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                product.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
