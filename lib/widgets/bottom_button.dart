import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BottomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: bottomContainerTopMargin),
        height: bottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: numberTextWeight,
                ),
          ),
        ),
      ),
    );
  }
}
