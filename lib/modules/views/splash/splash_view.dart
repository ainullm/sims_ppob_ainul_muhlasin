import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_colors.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_style.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/navigation_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationController>(context);

    if (navigation.currentPage == 0) {
      navigation.navigateToNext(context);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImages.icLogo.image(
              width: 25.w,
            ),
            SizedBox(height: 2.h),
            Text(
              'SIMS PPOB',
              style: AppStyle.headline1.copyWith(
                color: AppColors.blackDark,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Ainul Muhlasin',
              style: AppStyle.subtitle4.copyWith(
                color: AppColors.blackDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
