import 'package:flutter/material.dart';

import '../../../../shared/style/app_colors.dart';
import '../../../../shared/style/app_style.dart';

class MyBottomNavigationItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Widget activeImage;
  final Widget inactiveImage;
  final String title;
  final Function(int) onTap;

  const MyBottomNavigationItem({
    super.key,
    required this.currentIndex,
    required this.activeImage,
    required this.inactiveImage,
    required this.title,
    required this.onTap,
    required this.index,
  });

  Widget _buildImage() {
    return SizedBox(
      width: 24,
      height: 24,
      child: index == currentIndex ? activeImage : inactiveImage,
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: AppStyle.body2.copyWith(
        color: index == currentIndex ? AppColors.blackDark : AppColors.grey,
        fontWeight: index == currentIndex ? AppStyle.semiBold : AppStyle.medium,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(index),
      child: Column(
        children: [
          _buildImage(),
          _buildTitle(),
        ],
      ),
    ));
  }
}
