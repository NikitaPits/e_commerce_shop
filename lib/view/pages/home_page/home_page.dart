import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/view/UI/custom_app_bar_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final PageController pageController;
  const HomePage({super.key, required this.pageController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue40,
        title: const CustomAppBarTitle(title: 'Вітаємо'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            widget.pageController.animateToPage(1,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: CustomColors.gray,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          child: const Text('Почати шопінг'),
        ),
      ),
    );
  }
}
