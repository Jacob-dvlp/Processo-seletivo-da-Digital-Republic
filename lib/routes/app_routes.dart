import 'package:flutter/cupertino.dart';

import '../page/home/home_page.dart';
import '../page/splash/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routas = {
    '/': (context) => const SplashScreen(),
    '/ambiente': (context) => const HomePage(),
  };
}
