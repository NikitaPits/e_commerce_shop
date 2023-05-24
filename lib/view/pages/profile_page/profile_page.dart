import 'package:e_commerce_shop/theme/custom_colors.dart';
import 'package:e_commerce_shop/view/UI/custom_app_bar_title.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue40,
        title: const CustomAppBarTitle(title: 'Ваш профіль'),
      ),
    );
  }
}
