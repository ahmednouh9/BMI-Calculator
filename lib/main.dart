import 'package:bmi_1_app/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Bmi_Calculator(),
    ),
  );
  // runApp(Bmi_Calculator());
}

class Bmi_Calculator extends StatefulWidget {
  const Bmi_Calculator({super.key});

  @override
  State<Bmi_Calculator> createState() => _Bmi_CalculatorState();
}

class _Bmi_CalculatorState extends State<Bmi_Calculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: Scaffold(
        body: GenderSelection(),
      ),
    );
  }
}
