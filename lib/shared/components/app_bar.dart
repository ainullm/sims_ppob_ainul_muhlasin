import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_style.dart';
import 'colored_status_bar.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.color,
    required this.body,
    this.brightness = Brightness.dark,
    this.backImage,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.bgScaffold,
    this.actions,
    this.backCallback,
    this.resizeToAvoidBottomInset,
    this.usingDefaultColorStatusBar = false,
    this.bottom,
    this.centerTitle,
  });

  final Color? color;
  final Widget body;
  final Brightness brightness;
  final ImageProvider? backImage;
  final String? title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? bgScaffold;
  final List<Widget>? actions;
  final void Function()? backCallback;
  final bool usingDefaultColorStatusBar;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      brightness: brightness,
      color: usingDefaultColorStatusBar ? AppColors.primaryColor : color,
      child: Scaffold(
        backgroundColor: bgScaffold,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: AppBar(
          title: Text(
            title ?? '',
            style: titleStyle ??
                Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.white),
          ),
          centerTitle: centerTitle ?? false,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: 0.0,
          leading: InkWell(
            onTap: backCallback ?? () => Navigator.of(context).pop(),
            child: backImage == null
                ? const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  )
                : Image(
                    image: backImage!,
                    width: 24,
                    height: 24,
                  ),
          ),
          actions: actions ?? [],
          bottom: bottom,
        ),
        body: body,
      ),
    );
  }

  static PreferredSize primaryAppbar({
    required String titleString,
    Size preferredSize = const Size.fromHeight(52.0),
    TextStyle? titleStyle,
    bool? isBack = true,
    Widget? customAction,
    required BuildContext context,
    bool centerTitle = false,
  }) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: SizedBox.fromSize(
          size: preferredSize,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: customAction != null
                ? MainAxisAlignment.spaceBetween
                : centerTitle == false
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
            children: [
              if (isBack == true)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        size: 18,
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      titleString,
                      style: titleStyle ??
                          AppStyle.subtitle4.copyWith(
                            color: Colors.black,
                            fontWeight: AppStyle.semiBold,
                          ),
                    ),
                  ],
                ),
              Visibility(
                visible: isBack == false,
                child: Text(
                  titleString,
                  style: titleStyle ??
                      AppStyle.subtitle4.copyWith(
                        color: Colors.black,
                        fontWeight: AppStyle.semiBold,
                      ),
                ),
              ),
              customAction ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
