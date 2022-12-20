import 'package:flutter/material.dart';

import '../../utils/colors/app_color.dart';
import '../../utils/static/static_img.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.pushReplacementNamed(context, '/ambiente');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 250,
            left: 15,
            right: 0,
            child: SizedBox(
              child: Image.asset(
                StaticImg.backgroundImage,
                color: AppColor.colorGreen,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: LinearProgressIndicator(
              backgroundColor: AppColor.colorGreen,
              color: AppColor.colorWhite,
            ),
          )
        ],
      ),
    );
  }
}
