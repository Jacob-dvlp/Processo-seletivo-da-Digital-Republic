import 'package:flutter/material.dart';

import '../custom/widget/app_bar_custom.dart';
import '../custom/widget/widget_custom.dart';

class ResutadoPage extends StatelessWidget {
  final String? totalJanela;
  final String? totalParede;
  final String? totalPorta;
  final String? area;
  final String? lt;

  const ResutadoPage(
      {Key? key,
      this.totalJanela,
      this.totalParede,
      this.totalPorta,
      this.area,
      this.lt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Resultado'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detalheis da sua soma:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 05,
                  ),
                  WidgetCustomResult(
                      label:
                          'Soma da sua janela:  ${totalJanela.toString()}m'),
                  const SizedBox(
                    height: 20,
                  ),
                  WidgetCustomResult(
                      label:
                          'Soma da sua porta:  ${totalPorta.toString()}m'),
                  const SizedBox(
                    height: 20,
                  ),
                  WidgetCustomResult(
                      label:
                          'Soma da sua parede:  ${totalParede.toString()}m'),
                  const SizedBox(
                    height: 20,
                  ),
                  WidgetCustomResult(
                      label: 'Área que será pintada:  ${area.toString()}m'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        "Você tem que comprar ${lt.toString()} Litros de tinta",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
