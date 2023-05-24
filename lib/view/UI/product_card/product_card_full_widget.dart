import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_shop/data/bloc/bloc/cart_bloc.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCardPage extends StatelessWidget {
  final Product product;

  const ProductCardPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue40,
        title: const Text('Сторінка продукту'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CarouselSlider(
                    items: product.images!.map((image) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.network(image, fit: BoxFit.contain),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Ціна: \$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      product.description,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: CustomColors.green2,
          height: 56.0,
          child: OutlinedButton(
            onPressed: () {
              context.read<CartBloc>().add(AddProductToCart(product: product));
            },
            child: const Text(
              'Додати у кошик',
            ),
          ),
        ),
      ),
    );
  }
}
