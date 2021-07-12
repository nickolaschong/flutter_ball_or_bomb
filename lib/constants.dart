import 'package:flutter/material.dart';

abstract class GameConfig {
  static const isDebugMode = false;
  static const Duration gameDuration = Duration(seconds: 10);
  static const Duration dropSpeed = Duration(milliseconds: 1500);
  static const Color bombColor = Colors.black;
  static const List<Color> ballColors = [
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.lime
  ];
  static const int bombChancePercentage = 20;
}

abstract class SharedPrefKey {
  static const String highScore = 'highScore';
}
