import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFe2e2ee);
  static Color mainColor = const Color(0xFF000633);
  static Color accentColors = const Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  static TextStyle mainTitle =
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500);
}
