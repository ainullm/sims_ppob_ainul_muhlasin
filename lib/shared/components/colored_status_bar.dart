import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/app_colors.dart';

class ColoredStatusBar extends StatelessWidget {
  const ColoredStatusBar({
    super.key,
    this.color,
    this.child,
    this.brightness = Brightness.dark,
  });

  final Color? color;
  final Widget? child;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    const defaultColor = AppColors.transparant;
    final androidIconBrightness =
        brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color ?? defaultColor,
        statusBarIconBrightness: androidIconBrightness,
        statusBarBrightness: brightness,
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
