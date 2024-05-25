import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final VoidCallback onPress;

  const BMICard(
      {super.key, required this.color, this.child, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(cardMargin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: child,
      ),
    );
  }
}
