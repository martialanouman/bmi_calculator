import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0A0E21),
          background: Color(0xFF0A0E21),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: sliderActiveColor,
            inactiveTrackColor: sliderInactiveColor,
            thumbColor: sliderThumbColor,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 15.0,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 30.0,
            ),
            overlayColor: sliderThumbOverlayColor),
      ),
      home: const InputPage(),
    );
  }
}
