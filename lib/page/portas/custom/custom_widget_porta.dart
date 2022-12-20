import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/colors/app_color.dart';
import '../../../utils/helpers/label_helpers.dart';
import '../../custom/widget/widget_custom.dart';
import '../controller/portas_controller.dart';

class CustomWidgetPorta extends StatefulWidget {
  final double resultaParede;
  final double resultadoJanela;
  const CustomWidgetPorta(
      {super.key, required this.resultaParede, required this.resultadoJanela});

  @override
  State<CustomWidgetPorta> createState() => _CustomWidgetPortaState();
}

class _CustomWidgetPortaState extends State<CustomWidgetPorta> {
  final PortasController controller = PortasController();

  int qtdPortas = 0;

  int incrementarDemao() {
    setState(() {
      qtdPortas++;
    });
    if (qtdPortas == 4) {
      setState(() {
        qtdPortas = 0;
      });
    }
    return qtdPortas;
  }

  int decrementarDemao() {
    setState(() {
      qtdPortas--;
    });
    if (qtdPortas == 0) {
      setState(() {
        qtdPortas = 0;
      });
    }

    return qtdPortas;
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(context);
    });
    controller.resultadoParede = widget.resultaParede;
    controller.resultadoJanela = widget.resultadoJanela;
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
                  height: 110,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Altura da porta",
                            controller: controller.alturaPortaEditeController,
                            labelHelper: LabelHelpers.labelHelperother,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Largura da porta",
                            controller: controller.larguraPortaEditeController,
                            labelHelper: LabelHelpers.labelHelperother,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    child: Column(
                  children: [
                    Text(
                      'Quantas portas?',
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
                                      controller.qtdPortas = valor;
                                    }),
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      qtdPortas.toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                WidgetCount(
                                    color: AppColor.colorGreen,
                                    icon: '+',
                                    onTap: () {
                                      final valor = incrementarDemao();
                                      controller.qtdPortas = valor;
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Quantos demão?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(
                      height: 05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WidgetCount(
                            color: AppColor.colorGreen,
                            icon: '1',
                            onTap: () {
                              controller.qtdDemao = 1;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WidgetCount(
                            color: AppColor.colorGreen,
                            icon: '2',
                            onTap: () {
                              controller.qtdDemao = 2;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WidgetCount(
                            color: AppColor.colorGreen,
                            icon: '3',
                            onTap: () {
                              controller.qtdDemao = 3;
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 05,
          ),
          WidgetCustomElevatedButton(
            text: 'Proxíma',
            onPressed: () => controller.obterResultadoPorta(),
          )
        ],
      ),
    );
  }
}
