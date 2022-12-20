import 'package:calculadora_de_litro_de_tinta/page/custom/widget/snack_bar_custom.dart';
import 'package:flutter/material.dart';

import '../../../utils/helpers/label_helpers.dart';
import '../../janelas/janelas_page.dart';

class MaisDeUmaParedeController {
  final alturaParedeEditeController1 = TextEditingController(text: '0');
  final larguraParedeEditeController1 = TextEditingController(text: '0');
  final alturaParedeEditeController2 = TextEditingController(text: '0');
  final larguraParedeEditeController2 = TextEditingController(text: '0');
  final alturaParedeEditeController3 = TextEditingController(text: '0');
  final larguraParedeEditeController3 = TextEditingController(text: '0');
  final alturaParedeEditeController4 = TextEditingController(text: '0');
  final larguraParedeEditeController4 = TextEditingController(text: '0');

  BuildContext? context;
  MaisDeUmaParedeController({
    this.context,
  });


  void obterResultadoFinal() {
    if (alturaParedeEditeController1.text.isEmpty ||
        larguraParedeEditeController1.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    }
    if (alturaParedeEditeController2.text.isEmpty ||
        larguraParedeEditeController2.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    }
    if (alturaParedeEditeController3.text.isEmpty ||
        larguraParedeEditeController3.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    }
    if (alturaParedeEditeController4.text.isEmpty ||
        larguraParedeEditeController4.text.isEmpty) {
      return SnackBarCustom.show(context, LabelHelpers.msgInput);
    }

    double alturaParede1 = double.parse(alturaParedeEditeController1.text);
    double larguraParede1 = double.parse(larguraParedeEditeController1.text);
    double alturaParede2 = double.parse(alturaParedeEditeController2.text);
    double larguraParede2 = double.parse(larguraParedeEditeController2.text);
    double alturaParede3 = double.parse(alturaParedeEditeController3.text);
    double larguraParede3 = double.parse(larguraParedeEditeController3.text);
    double alturaParede4 = double.parse(alturaParedeEditeController4.text);
    double larguraParede4 = double.parse(larguraParedeEditeController4.text);

    calcularAsMedicoesDeUmaParede(
      alturaParede1: alturaParede1,
      larguraParede1: larguraParede1,
      alturaParede2: alturaParede2,
      larguraParede2: larguraParede2,
      alturaParede3: alturaParede3,
      larguraParede3: larguraParede3,
      alturaParede4: alturaParede4,
      larguraParede4: larguraParede4,
    );
  }

  //Obtendo o context para usar o Snackar
  void init(BuildContext buildContext) {
    context = buildContext;
  }

  //Método para somar as dimensões da 1º parede;
  double dimensoesDeParede1({double? alturaParde1, double? larguraParede1}) {
    double total = alturaParde1! * larguraParede1!;
    return total;
  }
  //Método para somar as dimensões da 2º parede;

  double dimensoesDeParede2({double? alturaParde2, double? larguraParede2}) {
    double total = alturaParde2! * larguraParede2!;
    return total;
  }
  //Método para somar as dimensões da 3º parede;

  double dimensoesDeParede3({double? alturaParde3, double? larguraParede3}) {
    double total = alturaParde3! * larguraParede3!;
    return total;
  }

  //Método para somar as dimensões da 4º parede;
  double dimensoesDeParede4({double? alturaParde4, double? larguraParede4}) {
    double total = alturaParde4! * larguraParede4!;
    return total;
  }

  //Método para calcular as dimensões de todas as paredes passados para ter o resultado final;
  String calcularAsMedicoesDeUmaParede({
    double? alturaParede1,
    double? larguraParede1,
    double? alturaParede2,
    double? larguraParede2,
    double? alturaParede3,
    double? larguraParede3,
    double? alturaParede4,
    double? larguraParede4,
  }) {
    double totalFinal = 0;

    double resultadoParede1 = dimensoesDeParede1(
        alturaParde1: alturaParede1!, larguraParede1: larguraParede1!);
    double resultadoParede2 = dimensoesDeParede2(
        alturaParde2: alturaParede2, larguraParede2: larguraParede2!);
    double resultadoParede3 = dimensoesDeParede3(
        alturaParde3: alturaParede3!, larguraParede3: larguraParede3!);
    double resultadoPared4 = dimensoesDeParede4(
        alturaParde4: alturaParede4!, larguraParede4: larguraParede4!);
    //Obtendo o resultado final das paredes;
    double resultadoParede = resultadoParede1 +
        resultadoParede2 +
        resultadoParede3 +
        resultadoPared4;
    if (resultadoParede <= 0) {
      String menssagemdimensoesDeParede = LabelHelpers.msgValuepast;
      SnackBarCustom.show(context, menssagemdimensoesDeParede);
      return totalFinal.toStringAsFixed(2);
    }
    //Proxima tela
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) => JanelasPage(resultParede: resultadoParede),
      ),
    );
    return totalFinal.toStringAsFixed(2);
  }
}
