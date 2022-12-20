import 'package:flutter/material.dart';

import '../../utils/colors/app_color.dart';
import '../custom/widget/app_bar_custom.dart';
import '../custom/widget/widget_custom.dart';
import '../dimensoes/dimensoes_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quantidade'),
      body: Container(
        padding: const EdgeInsets.only(top: 250, right: 20, left: 20),
        child: Column(
          children: [
            const Text(
              'Quantidade de Paredes',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DimensaoApp(flag: true);
                          },
                        ),
                      );
                    },
                    child: WidgetCustomContainerAmbiente(
                      color: AppColor.colorGreen,
                      title: 'Uma',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DimensaoApp(flag: false);
                        },
                      ));
                    },
                    child: WidgetCustomContainerAmbiente(
                      color: AppColor.colorGreen,
                      title: 'Mais de uma',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
