import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatefulWidget {
  final String title;
  const CustomAppBarTitle({super.key, required this.title});

  @override
  State<CustomAppBarTitle> createState() => _CustomAppBarTitleState();
}

class _CustomAppBarTitleState extends State<CustomAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.title));
  }
}
