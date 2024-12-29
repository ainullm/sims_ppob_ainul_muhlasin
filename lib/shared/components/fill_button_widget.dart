import 'package:flutter/material.dart';

import '../style/app_colors.dart';

///  default button on this project with primary color
///  change it as needed
class MyFillButton extends StatelessWidget {
  /// first option to use widget inside the button
  final Widget? child;

  /// Display text in button.
  final String? text;

  /// action function when button is onClick
  final void Function() onPressed;

  /// the option to change button color
  final Gradient? gradient;

  /// the width of the button.
  final double? width;

  /// the height of the button.
  final double? height;

  /// wether the button is can be clicked or not
  final bool enabled;

  /// for reversing only the color of the button including text if the code is using [title]
  final bool reverse;

  /// Background color of button. Default value is primary color.
  final Color? color;

  /// Border radius of the button
  final BorderRadiusGeometry? borderRadius;

  /// The radius of the button shape.
  final double? radiusValue;

  /// Width of the border
  final double? borderWidth;

  /// Text color of button, default value is white.
  final Color? borderColor;

  /// Elevation value of button.
  final double? elevation;

  /// Leading icon inside button.
  final IconData? icon;

  /// Text color of leading icon, default value is white.
  final Color? iconColor;

  /// Leading icon with Widget
  final Widget? leading;

  /// Text color of button, default value is white.
  final Color? textColor;

  /// The size of text button.
  final double? fontSize;

  /// Font weight text and icon inside button.
  final FontWeight? fontWeight;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  /// The button width will follow the content
  final bool expanded;

  const MyFillButton({
    super.key,
    this.child,
    this.text,
    required this.onPressed,
    this.gradient,
    this.width,
    this.height,
    this.borderRadius,
    this.radiusValue,
    this.borderWidth,
    this.borderColor,
    this.elevation,
    this.icon,
    this.iconColor,
    this.leading,
    this.enabled = true,
    this.reverse = false,
    this.color,
    this.textColor,
    this.fontSize = 14.0,
    this.fontWeight,
    this.margin,
    this.padding,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: expanded,
      replacement: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius ?? BorderRadius.circular(radiusValue ?? 5),
        ),
        child: ElevatedButton(
          onPressed: (enabled) ? onPressed : null,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: Colors.grey,
            elevation: elevation,
            backgroundColor: gradient != null
                ? Colors.transparent
                : enabled == false
                    ? Colors.red
                    : (reverse)
                        ? Theme.of(context).scaffoldBackgroundColor
                        : color,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(radiusValue ?? 5),
              side: BorderSide(
                color: enabled
                    ? (reverse)
                        ? borderColor ?? color ?? AppColors.primaryColor
                        : borderColor ?? Colors.transparent
                    : Colors.transparent,
                width: borderWidth ?? 1.5,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: child ??
                Text(
                  text.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: (!enabled)
                            ? Colors.white
                            : textColor ??
                                (reverse
                                    ? color ?? AppColors.primaryColor
                                    : Colors.white),
                      ),
                ),
          ),
        ),
      ),
      child: Expanded(
        child: Container(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius:
                borderRadius ?? BorderRadius.circular(radiusValue ?? 5),
          ),
          child: ElevatedButton(
            onPressed: (enabled) ? onPressed : null,
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.grey,
              elevation: elevation,
              backgroundColor: gradient != null
                  ? Colors.transparent
                  : enabled == false
                      ? Colors.red
                      : (reverse)
                          ? Theme.of(context).scaffoldBackgroundColor
                          : color,
              padding: padding,
              shape: RoundedRectangleBorder(
                borderRadius:
                    borderRadius ?? BorderRadius.circular(radiusValue ?? 5),
                side: BorderSide(
                  color: enabled
                      ? (reverse)
                          ? borderColor ?? color ?? AppColors.primaryColor
                          : borderColor ?? Colors.transparent
                      : Colors.transparent,
                  width: borderWidth ?? 1.5,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Container(
              padding: padding,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: child ??
                    Text(
                      text.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                            color: (!enabled)
                                ? Colors.white
                                : textColor ??
                                    (reverse
                                        ? color ?? AppColors.primaryColor
                                        : Colors.white),
                          ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
