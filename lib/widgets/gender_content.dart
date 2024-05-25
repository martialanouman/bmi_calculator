import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderContent extends StatelessWidget {
  final String text;
  final IconData symbol;

  const GenderContent({super.key, required this.symbol, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          symbol,
          size: iconSize,
        ),
        const SizedBox(
          height: gapSize,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: labelSize,
                color: textColor,
                fontWeight: textWeight,
              ),
        ),
      ],
    );
  }
}
