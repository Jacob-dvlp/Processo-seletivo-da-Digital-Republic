// ignore_for_file: library_private_types_in_public_api

import 'package:calculadora_de_litro_de_tinta/utils/colors/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(55),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.colorWhite),
      centerTitle: true,
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColor.colorGreen,
    );
  }
}
