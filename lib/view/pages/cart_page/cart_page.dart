import 'package:e_commerce_shop/data/bloc/bloc/cart_bloc.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/view/UI/custom_app_bar_title.dart';
import 'package:e_commerce_shop/view/pages/cart_page/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue40,
        title: const CustomAppBarTitle(title: 'Залишилось лише сплатити'),
      ),
      body: BlocBuilder<CartBloc, List<Product>>(
        builder: (context, state) {
          if (state.isNotEmpty) {
            return ProductList(
              products: state,
            );
          } else {
            return const Center(child: Text('Ви нічого не обрали'));
          }
        },
      ),
    );
  }

  double calculateTotalPrice(List<Product> products) {
    double totalPrice = 0;
    for (var product in products) {
      totalPrice += product.price;
    }
    return totalPrice;
  }
}
