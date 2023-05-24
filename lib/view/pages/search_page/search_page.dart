import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/utils/products_list.dart';
import 'package:e_commerce_shop/view/UI/custom_app_bar_title.dart';
import 'package:e_commerce_shop/view/UI/product_gallery/product_gallery.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Product> filteredProducts;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue40,
        title: const CustomAppBarTitle(title: 'Знайди щось для себе'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                controller: searchController,
                onChanged: filterProducts,
                decoration: const InputDecoration(
                  labelText: 'Пошук',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                )),
          ),
          Expanded(
            child: ProductGallery(
              products: filteredProducts,
            ),
          ),
        ],
      ),
    );
  }
}
