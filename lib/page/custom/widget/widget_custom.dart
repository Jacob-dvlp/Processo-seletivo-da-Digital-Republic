import 'package:flutter/material.dart';

import '../../../utils/colors/app_color.dart';

class WidgetCustomContainerAmbiente extends StatelessWidget {
  final Color color;
  final String title;
  const WidgetCustomContainerAmbiente(
      {Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.colorGreen,
          ),
          boxShadow: [BoxShadow(color: color)]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColor.colorWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetCount extends StatelessWidget {
  final Color color;
  final String icon;
  final Function() onTap;
  const WidgetCount(
      {Key? key, required this.color, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 40,
        color: color,
        child: Center(
          child: Text(
            icon,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: AppColor.colorWhite),
          ),
        ),
      ),
    );
  }
}

class WidgetCustomTextValue extends StatelessWidget {
  final TextEditingController controller;
  final String labelHelper;
  final String label;
  const WidgetCustomTextValue(
      {Key? key,
      required this.controller,
      required this.label,
      required this.labelHelper})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
      child: SizedBox(
        width: 300,
        height: 60,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              helperText: labelHelper,
              helperStyle: const TextStyle(
                fontSize: 13,
              ),
              label: Text(label),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0))),
          controller: controller,
        ),
      ),
    );
  }
}

class WidgetCustomResult extends StatelessWidget {
  final String label;
  const WidgetCustomResult({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class WidgetCustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const WidgetCustomElevatedButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.colorGreen,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: AppColor.colorWhite,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
