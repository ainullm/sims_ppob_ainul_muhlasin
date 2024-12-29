import 'package:flutter/material.dart';

class MyLabelButton extends StatelessWidget {
  const MyLabelButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.textStyle,
  });
  final String labelText;
  final void Function() onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        labelText,
        style: textStyle,
      ),
    );
  }
}
