import 'package:flutter/material.dart';

import '../../../utils/helpers/label_helpers.dart';
import '../../custom/widget/snack_bar_custom.dart';
import '../../resultado/resultado_page.dart';

class PortasController {
  final alturaPortaEditeController = TextEditingController(text: '0');
  final larguraPortaEditeController = TextEditingController(text: '0');

  String menssagemdimensoesDePortas = '';
  int qtdPortas = 1;
  int qtdDemao = 1;
  double totalFinal = 0;
  double resultadoParede = 0;
  double resultadoJanela = 0;
  BuildContext? context;

  void init(BuildContext buildContext) {
    context = buildContext;
  }

  // Metódo para converter  os valores dos inputs para double
  // E verficando se os campos estão vazios
  // E chamando o metódo de ir para proxima tela
  obterResultadoPorta() {
    if (alturaPortaEditeController.text.isEmpty ||
        larguraPortaEditeController.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    } else {
      double altura = double.parse(larguraPortaEditeController.text);
      double largura = double.parse(larguraPortaEditeController.text);
      proximaPage(altura, largura);
    }
  }

//Metódo para calcular as dimensões da Porta
  double dimensoesDePortas({double? alturaPorta, double? larguraPorta}) {
    double total = 0.0;
    if (alturaPorta! <= 1.90 && larguraPorta! <= 0.80) {
      total = alturaPorta * larguraPorta;
    } else {
      String menssagemdimensoesDePortas = LabelHelpers.msgDoormax;
      SnackBarCustom.show(context!, menssagemdimensoesDePortas);
      return total;
    }
    return total;
  }

  String proximaPage(double? alturaPorta, double? larguraPorta) {
    double resultadoPortas =
        dimensoesDePortas(alturaPorta: alturaPorta, larguraPorta: larguraPorta);
    double resultaPortasJanelas = resultadoPortas + resultadoJanela;
    if (resultadoParede >= 1) {

      double resultadoArea = resultadoParede * 50 / 100 - resultaPortasJanelas;
      if (resultadoParede >= 51 || resultadoParede <= -0) {
        String menssagemdimensoesDeParede = LabelHelpers.msgArea;
        SnackBarCustom.show(context, menssagemdimensoesDeParede);
      } else {
        final resutadoFinal = resultadoArea * qtdDemao / 10;
        if (resutadoFinal <= -0) {
          return totalFinal.toStringAsFixed(2);
        }
        final resultadoDeLitrosDeTinta = resutadoFinal;
        totalFinal = resultadoDeLitrosDeTinta;
        
        //Chamando proxima tela  e passando dados por parametros
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => ResutadoPage(
              totalJanela: resultadoJanela.toStringAsFixed(2).toString(),
              totalParede: resultadoParede.toStringAsFixed(2).toString(),
              totalPorta: resultadoPortas.toStringAsFixed(2).toString(),
              area: resultadoArea.toStringAsFixed(2).toString(),
              lt: totalFinal.toStringAsFixed(2).toString(),
            ),
          ),
        );
      }
    }
    return totalFinal.toStringAsFixed(2);
  }
}
