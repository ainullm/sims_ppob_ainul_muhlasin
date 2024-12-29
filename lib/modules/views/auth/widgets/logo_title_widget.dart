import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/style/app_colors.dart';
import '../../../../shared/style/app_style.dart';

class MyLogoTitle extends StatelessWidget {
  MyLogoTitle({
    super.key,
    this.image,
    this.textLogo,
    this.textStyle,
  });

  Widget? image;
  String? textLogo;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image ?? const SizedBox(),
        const SizedBox(width: 10),
        Text(
          textLogo ?? 'Text Logo',
          style: textStyle ??
              AppStyle.subtitle2.copyWith(
                color: AppColors.blackDark,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
