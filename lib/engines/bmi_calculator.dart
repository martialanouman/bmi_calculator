import 'dart:math';

class BMICalculator {
  final int weight;
  final int height;

  late final double _bmi;

  BMICalculator({required this.height, required this.weight})
      : _bmi = weight / pow(height / 100, 2);

  String getBmi() => _bmi.toStringAsFixed(1);

  String getSummary() {
    print(_bmi);
    if (_bmi > 18.5 && _bmi < 25) return 'Normal';

    if (_bmi >= 25) return 'Overweight';

    return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi > 18.5 && _bmi < 25) {
      return 'You have a normal body weight. Good job!';
    }

    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercice more.';
    }

    return 'You have a lower than normal body weight. You should eat a bit more.';
  }
}
