import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'utils/colors/app_color.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppColor.themeColor,
      routes: AppRoutes.routas,
      initialRoute: '/',
    );
  }
}
