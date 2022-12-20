import 'package:flutter/material.dart';

import '../custom/widget/app_bar_custom.dart';
import 'custom/custom_widget_porta.dart';

class PortasPage extends StatelessWidget {
  final double resultaParede;
  final double resultadoJanela;
  const PortasPage(
      {super.key, required this.resultaParede, required this.resultadoJanela});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Portas'),
      body: CustomWidgetPorta(
          resultaParede: resultaParede, resultadoJanela: resultadoJanela),
    );
  }
}
