import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/colors/app_color.dart';
import '../../../utils/helpers/label_helpers.dart';
import '../../custom/widget/widget_custom.dart';
import '../controllers/uma_parede_controller.dart';

class FormularioWidgetUmaParede extends StatefulWidget {
  const FormularioWidgetUmaParede({Key? key}) : super(key: key);

  @override
  State<FormularioWidgetUmaParede> createState() => _FormWidgetBodyState();
}

class _FormWidgetBodyState extends State<FormularioWidgetUmaParede> {
  int demaoEditeController = 1;

  final UmaParedeController controller = UmaParedeController();

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
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Altura da Parede",
                            controller: controller.alturaParedeEditeController,
                            labelHelper: LabelHelpers.labelHelperWallW,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Largura da Parede",
                            controller: controller.larguraParedeEditeController,
                            labelHelper: LabelHelpers.labelHelperWallH,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Altura da Janela",
                            controller: controller.alturaJanelaEditeController,
                            labelHelper: LabelHelpers.labelHelperother,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Largura da Janela",
                            controller: controller.larguraJanelaEditeController,
                            labelHelper: LabelHelpers.labelHelperother,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Altura da Porta",
                            controller: controller.alturaPortaEditeController,
                            labelHelper: LabelHelpers.labelHelperother,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Largura da Porta",
                            controller: controller.larguraPortaEditeController,
                            labelHelper: LabelHelpers.labelHelperother,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    child: Column(
                  children: [
                    Text(
                      'Quantos demão?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetCount(
                                    color: AppColor.colorGreen,
                                    icon: '-',
                                    onTap: () {
                                      int valor = decrementarDemao();
                                      controller.demaoEditeController = valor;
                                    }),
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      demaoEditeController.toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                WidgetCount(
                                    color: AppColor.colorGreen,
                                    icon: '+',
                                    onTap: () {
                                      final valor = incrementarDemao();
                                      controller.demaoEditeController = valor;
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
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
