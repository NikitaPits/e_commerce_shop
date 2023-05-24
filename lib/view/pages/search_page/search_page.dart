import 'package:e_commerce_shop/data/models/category_model.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/utils/categorys_list.dart';
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

    filteredProducts = getProductsFromCategories(
        categories); // Получаем все продукты из категорий
  }

  List<Product> getProductsFromCategories(List<ProductCategory> categories) {
    // Возвращает все продукты из категорий
    List<Product> allProducts = [];
    for (var category in categories) {
      allProducts.addAll(category.products);
    }
    return allProducts;
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = getProductsFromCategories(categories)
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.blue40,
          title: const CustomAppBarTitle(title: 'Знайди щось для себе'),
          bottom: TabBar(
            isScrollable: true,
            tabs: categories.map((category) {
              return Tab(
                text: category.name,
              );
            }).toList(),
          ),
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
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: categories.map((category) {
                  final categoryProducts = filteredProducts
                      .where((product) => category.products.contains(product))
                      .toList();
                  if (categoryProducts.isEmpty) {
                    return const Center(
                        child:
                            Text('Нажаль зараз немає нічого з цієї категорії'));
                  }
                  return Center(
                    child: ProductGallery(
                      products: categoryProducts,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
