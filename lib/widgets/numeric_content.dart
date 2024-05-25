import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class NumericContent extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncreased;
  final VoidCallback onDecreased;

  const NumericContent(
      {super.key,
      required this.label,
      required this.onDecreased,
      required this.value,
      required this.onIncreased});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: labelSize,
                color: textColor,
                fontWeight: textWeight,
              ),
        ),
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: numberTextWeight,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: onDecreased,
              iconData: Icons.remove,
            ),
            const SizedBox(
              width: 15.0,
            ),
            RoundIconButton(
              iconData: Icons.add,
              onPressed: onIncreased,
            ),
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;

  const RoundIconButton(
      {super.key, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: cardButtonColor,
      elevation: 0,
      child: Icon(
        iconData,
        color: cardButtonIconColor,
      ),
    );
  }
}
