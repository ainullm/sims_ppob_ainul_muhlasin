import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFf23b2c);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFf44336);
  static const Color transparant = Colors.transparent;

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blackLight = Color(0xFF424242);
  static const Color blackDark = Color.fromARGB(255, 56, 56, 56);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF616161);
  static const Color blue = Color(0xFF2196F3);
  static const Color blueLight = Color(0xFFBBDEFB);
  static const Color blueDark = Color(0xFF1976D2);
  static const Color red = Color(0xFFf44336);
  static const Color redLight = Color(0xFFEF9A9A);
  static const Color redDark = Color(0xFFD32F2F);
  static const Color green = Color(0xFF4CAF50);
  static const Color greenLight = Color(0xFFA5D6A7);
  static const Color greenDark = Color(0xFF388E3C);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color yellowLight = Color(0xFFFFF59D);
  static const Color yellowDark = Color(0xFFFBC02D);
  static const Color orange = Color(0xFFFF9800);
  static const Color orangeLight = Color(0xFFFFCC80);
  static const Color orangeDark = Color(0xFFFB8C00);

  // Material Color
  static Map<int, Color> color = {
    50: const Color.fromRGBO(255, 255, 255, 1.0),
    100: const Color.fromRGBO(255, 255, 255, 0.9294117647058824),
    200: const Color.fromRGBO(255, 255, 255, 1.0),
    300: const Color.fromRGBO(213, 209, 211, 1.0),
    400: const Color.fromRGBO(199, 198, 199, 1.0),
    500: const Color.fromRGBO(179, 175, 177, 1.0),
    600: const Color.fromRGBO(156, 155, 156, 1.0),
    700: const Color.fromRGBO(139, 136, 137, 1.0),
    800: const Color.fromRGBO(68, 68, 68, 1.0),
    900: const Color.fromRGBO(45, 45, 45, 1.0),
  };

  static MaterialColor materialPrimary = MaterialColor(0xFF212121, color);
  static MaterialColor materialAccent = MaterialColor(0xFFFFA438, color);
}
