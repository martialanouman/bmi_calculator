import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/engines/bmi_calculator.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/widgets/bmi_card.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/gender_content.dart';
import 'package:bmi_calculator/widgets/numeric_content.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    child: const GenderContent(
                      symbol: Icons.male,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    child: const GenderContent(
                        symbol: Icons.female, text: 'FEMALE'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              onPress: () {},
              color: activeCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontWeight: numberTextWeight,
                                ),
                      ),
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: labelSize,
                              color: textColor,
                              fontWeight: textWeight,
                            ),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 120,
                    max: 220,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    color: activeCardColor,
                    onPress: () {},
                    child: NumericContent(
                      label: 'WEIGHT',
                      onDecreased: () {
                        setState(() {
                          weight--;
                        });
                      },
                      value: weight,
                      onIncreased: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    onPress: () {},
                    color: activeCardColor,
                    child: NumericContent(
                      label: 'AGE',
                      onDecreased: () {
                        setState(() {
                          age--;
                        });
                      },
                      value: age,
                      onIncreased: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              BMICalculator calc =
                  BMICalculator(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    summary: calc.getSummary(),
                    bmi: calc.getBmi(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            label: 'Calculate',
          )
        ],
      ),
    );
  }
}
