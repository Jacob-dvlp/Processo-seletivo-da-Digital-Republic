import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/colors/app_color.dart';
import '../../../utils/helpers/label_helpers.dart';
import '../../custom/widget/widget_custom.dart';
import '../controller/janelas_controller.dart';

class CustomWidget extends StatefulWidget {
  final double resultParede;
  const CustomWidget({
    Key? key,
    required this.resultParede,
  }) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  final JanelasController controller = JanelasController();

  int qtdJanela = 0;
  int incrementarDemao() {
    setState(() {
      qtdJanela++;
    });
    if (qtdJanela == 4) {
      setState(() {
        qtdJanela = 0;
      });
    }
    return qtdJanela;
  }

  int decrementarDemao() {
    setState(() {
      qtdJanela--;
    });
    if (qtdJanela == 0) {
      setState(() {
        qtdJanela = 0;
      });
    }
    return qtdJanela;
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(context);
    });
    controller.resultadoParede = widget.resultParede;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColor.colorWhite,
            height: 580,
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Altura da janela",
                            controller: controller.alturaJanelaEditeController,
                            labelHelper: LabelHelpers.labelHelperother,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetCustomTextValue(
                            label: "Largura da janela",
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
                  children: [
                    Text(
                      'Quantidade de janelas',
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
                                      controller.qtdJanela = valor;
                                    }),
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      qtdJanela.toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                WidgetCount(
                                  color: AppColor.colorGreen,
                                  icon: '+',
                                  onTap: () {
                                    final valor = incrementarDemao();
                                    controller.qtdJanela = valor;
                                  },
                                ),
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
          WidgetCustomElevatedButton(
            text: 'Proxíma',
            onPressed: () => controller.obterResultadoJanela(),
          )
        ],
      ),
    );
  }
}
