import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/view/UI/custom_app_bar_title.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue40,
        title: const CustomAppBarTitle(title: 'Залишилось лише сплатити'),
      ),
    );
  }
}
