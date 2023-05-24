import 'package:e_commerce_shop/data/bloc/bloc/cart_bloc.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:e_commerce_shop/view/UI/product_card/product_card_full_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return GestureDetector(
          key: Key('product_${product.name}'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProductCardPage(
                product: product,
              );
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(DeleteProduct(product: product));
                  },
                ),
                const SizedBox(width: 8),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: product.images!.isNotEmpty
                      ? Image.network(
                          product.images![0],
                          width: 60,
                          height: 60,
                          fit: BoxFit.contain,
                        )
                      : const Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ціна: \$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
