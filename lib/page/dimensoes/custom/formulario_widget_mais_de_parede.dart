import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/colors/app_color.dart';
import '../../../utils/helpers/label_helpers.dart';
import '../../custom/widget/widget_custom.dart';
import '../controllers/mais_de_uma_controller.dart';

class FormularioWidgetMaisDeUmaParede extends StatefulWidget {
  const FormularioWidgetMaisDeUmaParede({super.key});

  @override
  State<FormularioWidgetMaisDeUmaParede> createState() =>
      _FormularioWidgetMaisDeUmaParedeState();
}

class _FormularioWidgetMaisDeUmaParedeState
    extends State<FormularioWidgetMaisDeUmaParede> {
  int demaoEditeController = 0;
  final MaisDeUmaParedeController controller = MaisDeUmaParedeController();

  int incrementarDemao() {
    setState(() {
      demaoEditeController++;
    });
    if (demaoEditeController == 4) {
      setState(() {
        demaoEditeController = 1;
      });
    }
    return demaoEditeController;
  }

  int decrementarDemao() {
    setState(() {
      demaoEditeController--;
    });
    if (demaoEditeController == 0) {
      setState(() {
        demaoEditeController = 1;
      });
    }

    return demaoEditeController;
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColor.colorWhite,
            height: 580,
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('1º Parede'),
                      WidgetCustomTextValue(
                        label: "Altura da Parede",
                        controller: controller.alturaParedeEditeController1,
                        labelHelper: LabelHelpers.labelHelperWallW,
                      ),
                      WidgetCustomTextValue(
                        label: "Largura da Parede",
                        controller: controller.larguraParedeEditeController1,
                        labelHelper: LabelHelpers.labelHelperWallH,
                      ),
                      const Text('2º Parede'),
                      WidgetCustomTextValue(
                        label: "Altura da Parede",
                        controller: controller.alturaParedeEditeController2,
                        labelHelper: LabelHelpers.labelHelperWallW,
                      ),
                      WidgetCustomTextValue(
                        label: "Largura da Parede",
                        controller: controller.larguraParedeEditeController2,
                        labelHelper: LabelHelpers.labelHelperWallH,
                      ),
                      const Text('3º Parede'),
                      WidgetCustomTextValue(
                        label: "Altura da Parede",
                        controller: controller.alturaParedeEditeController3,
                        labelHelper: LabelHelpers.labelHelperWallW,
                      ),
                      WidgetCustomTextValue(
                        label: "Largura da Parede",
                        controller: controller.larguraParedeEditeController3,
                        labelHelper: LabelHelpers.labelHelperWallH,
                      ),
                      const Text('4º Parede'),
                      WidgetCustomTextValue(
                        label: "Altura da Parede",
                        controller: controller.alturaParedeEditeController4,
                        labelHelper: LabelHelpers.labelHelperWallW,
                      ),
                      WidgetCustomTextValue(
                        label: "Largura da Parede",
                        controller: controller.larguraParedeEditeController4,
                        labelHelper: LabelHelpers.labelHelperWallH,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 05,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.colorGreen,
                ),
                onPressed: () {
                  controller.obterResultadoFinal();
                },
                child: Text(
                  'Próximo',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.colorWhite,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
