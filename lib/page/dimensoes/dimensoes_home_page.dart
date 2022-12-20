import 'package:flutter/material.dart';

import '../custom/widget/app_bar_custom.dart';
import 'custom/formulario_widget_mais_de_parede.dart';
import 'custom/formulario_widget_uma_parede.dart';

class DimensaoApp extends StatelessWidget {
  final bool flag;
  const DimensaoApp({
    Key? key,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dimensão da área',
      ),
      body: flag
          ? const FormularioWidgetUmaParede()
          : const FormularioWidgetMaisDeUmaParede(),
    );
  }
}
