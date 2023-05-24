import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/view/UI/custom_app_bar_title.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue40,
        title: const CustomAppBarTitle(title: 'Знайди щось для себе'),
      ),
    );
  }
}
