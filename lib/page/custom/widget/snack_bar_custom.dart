import 'package:flutter/material.dart';

class SnackBarCustom {
  static void show(BuildContext? context, String text) {
    if (context == null) return;
    FocusScope.of(context).requestFocus(FocusNode());
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        dismissDirection: DismissDirection.endToStart,
        duration: const Duration(seconds: 7),
      ),
    );
  }
}
