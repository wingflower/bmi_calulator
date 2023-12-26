import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    required this.height,
    required this.weight,
    super.key,
  });

  String _calcBmi(double bmi) {
    String result = '저체중';
    if (bmi >= 35) {
      return '고도 비만';
    } else if (bmi >= 30) {
      return '2단계 비만';
    } else if (bmi >= 25) {
      return '1단계 비만';
    } else if (bmi >= 23) {
      return '과체중';
    } else if (bmi >= 18.5) {
      return '정상';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    Icon icon = const Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.green,
      size: 100,
    );
    if (bmi >= 23) {
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.green,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      icon = const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    print(bmi);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _calcBmi(bmi),
          // '정상',
          style: const TextStyle(fontSize: 36),
        ),
        _buildIcon(bmi),
      ],
    );
  }
}
