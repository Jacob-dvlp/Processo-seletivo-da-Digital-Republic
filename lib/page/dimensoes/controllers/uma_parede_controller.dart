import 'package:flutter/material.dart';

import '../../../utils/helpers/label_helpers.dart';
import '../../custom/widget/snack_bar_custom.dart';
import '../../resultado/resultado_page.dart';

class UmaParedeController {
  final alturaParedeEditeController = TextEditingController(text: '0');
  final larguraParedeEditeController = TextEditingController(text: '0');
  final alturaJanelaEditeController = TextEditingController(text: '0');
  final larguraJanelaEditeController = TextEditingController(text: '0');
  final alturaPortaEditeController = TextEditingController(text: '0');
  final larguraPortaEditeController = TextEditingController(text: '0');

  BuildContext? context;
  int demaoEditeController = 1;
  String menssagemdimensoesDeParede = '';
  String menssagemdimensoesDeJanela = '';
  String menssagemdimensoesDePortas = '';
  double resultadoPortas = 0;
  double resultadoParede = 0;
  double resultadoJanelas = 0;
  double resultadoArea = 0;
  double totalFinal = 0;

  UmaParedeController({
    this.context,
  });

  void obterResultadoFinal() {
    if (alturaParedeEditeController.text.isEmpty ||
        larguraParedeEditeController.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    }
    if (alturaJanelaEditeController.text.isEmpty ||
        larguraJanelaEditeController.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    }
    if (alturaPortaEditeController.text.isEmpty ||
        larguraPortaEditeController.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    }
    double alturaParede = double.parse(alturaParedeEditeController.text);
    double larguraParede = double.parse(larguraParedeEditeController.text);
    double larguraPorta = double.parse(larguraPortaEditeController.text);
    double alturaPorta = double.parse(alturaPortaEditeController.text);
    double alturaJanela = double.parse(alturaJanelaEditeController.text);
    double larguraJanela = double.parse(larguraJanelaEditeController.text);
    double qtDeMao = demaoEditeController.toDouble();

    calcularAsMedicoesDeUmaParede(
      alturaParede: alturaParede,
      larguraParede: larguraParede,
      larguraPorta: larguraPorta,
      alturaPorta: alturaPorta,
      alturaJanela: alturaJanela,
      larguraJanela: larguraJanela,
      qtDeMao: qtDeMao,
    );
  }

  //Obtendo o context para usar o Snackbar
  void init(BuildContext buildContext) {
    context = buildContext;
  }

  //Metódo para calcular as dimensões da Parede
  double dimensoesDeParede({double? largura, double? altura}) {
    double total = 0.0;
    if (largura! <= 0.99 || altura! <= 0.99) {
      menssagemdimensoesDeParede = LabelHelpers.msgValuepast;
      SnackBarCustom.show(context, menssagemdimensoesDeParede);
      return total;
    } else if (altura >= 1 && largura >= 0) {
      total = altura * largura;
    }
    return total;
  }

  //Metódo para calcular as dimensões da janela
  double dimensoesDeJanela({double? alturaJanela, double? larguraJanela}) {
    double total = 0.0;
    if (alturaJanela! <= 2.00 && larguraJanela! <= 1.20) {
      total = alturaJanela * larguraJanela;
    } else {
      menssagemdimensoesDeJanela = LabelHelpers.msgWindowmax;
      SnackBarCustom.show(context, menssagemdimensoesDeJanela);
      return total;
    }

    return total;
  }

  //Metódo para calcular as dimensões da Porta
  double dimensoesDePortas({double? alturaPorta, double? larguraPorta}) {
    double total = 0.0;
    if (alturaPorta! <= 1.90 && larguraPorta! <= 0.80) {
      total = alturaPorta * larguraPorta;
    } else {
      menssagemdimensoesDePortas = LabelHelpers.msgDoormax;
      SnackBarCustom.show(context, menssagemdimensoesDePortas);
      return total;
    }
    return total;
  }

//Método para calcular as dimensões da parede,janela  e porta para ter o resultado final e com  quantidade de litros de tintas que devem ser comprado.
  String calcularAsMedicoesDeUmaParede(
      {double? alturaParede,
      double? larguraParede,
      double? larguraPorta,
      double? alturaPorta,
      double? alturaJanela,
      double? larguraJanela,
      double? qtDeMao}) {
    resultadoJanelas = dimensoesDeJanela(
        alturaJanela: alturaJanela, larguraJanela: larguraJanela);
    resultadoPortas =
        dimensoesDePortas(larguraPorta: larguraPorta, alturaPorta: alturaPorta);
    double resultPortasJanelas = resultadoJanelas + resultadoPortas;
    resultadoParede =
        dimensoesDeParede(altura: alturaParede!, largura: larguraParede!);
    if (resultadoParede <= 0) {
      return totalFinal.toStringAsFixed(2);
    } else if (resultadoParede >= 1) {
      resultadoArea = resultadoParede * 50 / 100 - resultPortasJanelas;
      if (resultadoParede >= 50 || resultadoParede <= -1.90) {
        menssagemdimensoesDeParede = LabelHelpers.msgArea;
        SnackBarCustom.show(context, menssagemdimensoesDeParede);
      } else {
        final resutadoFinal = resultadoArea * qtDeMao! / 10;
        if (resutadoFinal <= -0) {
          return totalFinal.toStringAsFixed(2);
        }
        final resultadoDeLitrosDeTinta = resutadoFinal;
        totalFinal = resultadoDeLitrosDeTinta;
        //Proxima tela
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => ResutadoPage(
              totalJanela: resultadoJanelas.toStringAsFixed(2).toString(),
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
