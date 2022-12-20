import 'package:flutter/material.dart';

import '../custom/widget/app_bar_custom.dart';
import 'custom/custom_widget.dart';

class JanelasPage extends StatelessWidget {
  final double resultParede;
  const JanelasPage({super.key, required this.resultParede});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Janela'),
      body: CustomWidget(resultParede: resultParede),
    );
  }
}
