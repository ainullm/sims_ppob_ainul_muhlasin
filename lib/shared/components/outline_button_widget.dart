import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_style.dart';

class MyOutlineButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final void Function()? onPressed;
  final bool? expanded;
  final Color? color;
  final Color? textColor;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;

  /// The size of text button.
  final double? fontSize;

  /// Font weight text and icon inside button.
  final FontWeight? fontWeight;

  const MyOutlineButton({
    super.key,
    this.text,
    this.onPressed,
    this.expanded = true,
    this.color = AppColors.blackDark,
    this.textColor = AppColors.blackDark,
    this.child,
    this.padding,
    this.margin,
    this.borderRadius = 3,
    this.width = double.infinity,
    this.height,
    this.fontSize = 14.0,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: expanded!,
      replacement: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            side: BorderSide(color: color!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
          child: Visibility(
            visible: child == null,
            replacement: child ?? const SizedBox(),
            child: Text(
              text ?? "",
              style: AppStyle.body3.copyWith(
                color: textColor!,
                fontSize: fontSize,
                fontWeight: fontWeight ?? AppStyle.medium,
              ),
            ),
          ),
        ),
      ),
      child: Expanded(
        child: Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: padding,
              side: BorderSide(color: color!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
            ),
            child: Visibility(
              visible: child == null,
              replacement: child ?? const SizedBox(),
              child: Text(
                text ?? "",
                style: AppStyle.body3.copyWith(
                  color: textColor!,
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? AppStyle.medium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
