import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatefulWidget {
  final Product product;

  const ProductCarousel({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCarouselState createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            widget.product.name,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CarouselSlider(
          items: widget.product.images!.map((image) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.network(image, fit: BoxFit.contain),
            );
          }).toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Text(
                'Ціна: \$${widget.product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.product.images!.map((image) {
                  int index = widget.product.images!.indexOf(image);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentImageIndex == index
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
