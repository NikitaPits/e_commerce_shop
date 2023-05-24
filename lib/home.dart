import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/view/pages/home_page/home_page.dart';
import 'package:e_commerce_shop/view/pages/product_page/product_page.dart';
import 'package:e_commerce_shop/view/pages/profile_page/profile_page';
import 'package:e_commerce_shop/view/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller =
      PageController(initialPage: 0, keepPage: true);

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        children: [
          HomePage(pageController: _controller),
          const SearchPage(),
          const ProductPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomButton(0, 'Головна', Icons.home),
              _bottomButton(1, 'Шукати', Icons.search),
              _bottomButton(2, 'Корзина', Icons.shopping_cart_rounded),
              _bottomButton(3, 'Профіль', Icons.verified_user),
            ],
          ),
        ),
      ),
    );
  }

  _bottomButton(int currentPage, String title, IconData icon) {
    return SizedBox(
      width: 70,
      child: GestureDetector(
        onTap: () {
          setState(() {
            pageIndex = currentPage;
          });
          _controller.animateToPage(currentPage,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 40,
              color: pageIndex == currentPage
                  ? CustomColors.blue
                  : CustomColors.gray2,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 10,
                  color: pageIndex == currentPage
                      ? CustomColors.blue
                      : CustomColors.gray2),
            )
          ],
        ),
      ),
    );
  }
}
