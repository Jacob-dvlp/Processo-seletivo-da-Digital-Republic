import 'package:flutter/material.dart';

import '../../../utils/helpers/label_helpers.dart';
import '../../custom/widget/snack_bar_custom.dart';
import '../../portas/portas_page.dart';

class JanelasController {
  final alturaJanelaEditeController = TextEditingController(text: '0');
  final larguraJanelaEditeController = TextEditingController(text: '0');
  double resultadoParede = 0;
  int qtdJanela = 0;
  BuildContext? context;

  void init(BuildContext buildContext) {
    context = buildContext;
  }

  // Metódo para converter  os valores dos inputs para double
  // E verficando se os campos estão vazios
  // E chamando o metódo de ir para proxima tela
  obterResultadoJanela() {
    if (alturaJanelaEditeController.text.isEmpty ||
        larguraJanelaEditeController.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    } else {
      double altura = double.parse(alturaJanelaEditeController.text);
      double largura = double.parse(larguraJanelaEditeController.text);
      return proximaPage(alturaJanela: altura, larguraJanela: largura);
    }
  }

  //Metódo para calcular as dimensões da janela

  double dimensoesDeJanela({double? alturaJanela, double? larguraJanela}) {
    double total = 0.0;
    if (alturaJanela! <= 2.00 && larguraJanela! <= 1.20) {
      total = alturaJanela * larguraJanela;
    } else {
      String menssagemdimensoesDeJanela = LabelHelpers.msgWindowmax;
      SnackBarCustom.show(context, menssagemdimensoesDeJanela);
      return total;
    }
    return total;
  }

  //Metódo para ir para proxima tela  e passando o resultado final das janelas

  proximaPage({double? alturaJanela, double? larguraJanela}) {
    final resultadoJanela = dimensoesDeJanela(
        alturaJanela: alturaJanela, larguraJanela: larguraJanela);
    final total = resultadoJanela + qtdJanela;
    Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => PortasPage(
            resultaParede: resultadoParede,
            resultadoJanela: total,
          ),
        ));
  }
}
