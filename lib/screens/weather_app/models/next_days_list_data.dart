import 'package:flutter/material.dart';

class NextDaysData {
  NextDaysData({
    this.meals,
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = Colors.grey,
    this.endColor = Colors.grey,
    this.kcal = 0,
  });

  String? imagePath;
  String? titleTxt;
  Color startColor;
  Color endColor;
  List<String>? meals;
  int kcal;

  static List<NextDaysData> tabIconsList = <NextDaysData>[
    NextDaysData(
      startColor: const Color(0xFFFA7D82),
      endColor: const Color(0xFFFFB295),
    ),
    NextDaysData(
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: const Color(0xFF738AE6),
      endColor: const Color(0xFF5C5EDD),
    ),
    NextDaysData(
      startColor: const Color(0xFFFE95B6),
      endColor: const Color(0xFFFF5287),
    ),
    NextDaysData(
      startColor: const Color(0xFF6F72CA),
      endColor: const Color(0xFF1E1466),
    ),
    NextDaysData(
      meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
      startColor: const Color(0xFFFA7D82),
      endColor: const Color(0xFFFFB295),
    ),
    NextDaysData(
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: const Color(0xFF738AE6),
      endColor: const Color(0xFF5C5EDD),
    ),
    NextDaysData(
      startColor: const Color(0xFFFE95B6),
      endColor: const Color(0xFFFF5287),
    ),
    NextDaysData(
      startColor: const Color(0xFF6F72CA),
      endColor: const Color(0xFF1E1466),
    ),
  ];
}
