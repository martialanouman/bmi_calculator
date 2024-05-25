import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bmi_card.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

const resultHorizontalPadding = 15.0;
const resultSummaryColor = Color(0xFF24D876);

class ResultPage extends StatelessWidget {
  final String bmi;
  final String summary;
  final String interpretation;

  const ResultPage({
    super.key,
    required this.bmi,
    required this.interpretation,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: resultHorizontalPadding,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Result',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: BMICard(
              color: activeCardColor,
              onPress: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    summary,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: resultSummaryColor),
                  ),
                  Text(
                    bmi,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpretation,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            label: 'Re-calculate',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
