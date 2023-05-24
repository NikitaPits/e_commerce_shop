import 'package:e_commerce_shop/data/bloc/bloc/cart_bloc.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/view/pages/cart_page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarTitle extends StatefulWidget {
  final bool? showCartIcon;
  final String title;
  const CustomAppBarTitle(
      {super.key, required this.title, this.showCartIcon = true});

  @override
  State<CustomAppBarTitle> createState() => _CustomAppBarTitleState();
}

class _CustomAppBarTitleState extends State<CustomAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        Text(widget.title),
        const Spacer(),
        if (widget.showCartIcon == true)
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CartPage();
              }));
            },
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                BlocBuilder<CartBloc, List<Product>>(
                  builder: (context, state) {
                    return Text(
                      state.length.toString(),
                      style: const TextStyle(
                          color: CustomColors.black,
                          fontWeight: FontWeight.w800),
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    ));
  }
}
