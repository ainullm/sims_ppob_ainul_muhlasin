import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_style.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_theme.dart';

import '../../../shared/components/colored_status_bar.dart';
import '../../../shared/resources/rersources.dart';
import '../../../shared/style/app_colors.dart';
import '../../controllers/navigation_controller.dart';
import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../top_up/top_up_view.dart';
import '../transaction/transaction_view.dart';
import 'widgets/buttom_navigation_widget.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NavigationController>(context);

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Text(
              'Konfirmasi Keluar',
              style: AppStyle.subtitle2,
            ),
            content: Text(
              'Apakah Anda yakin ingin keluar dari aplikasi?',
              style: AppStyle.body1,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false), // Don't pop
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true), // Pop the screen
                child: const Text('Ya'),
              ),
            ],
          ),
        );
        return shouldPop ?? false;
      },
      child: ColoredStatusBar(
        brightness: Theme.of(context).brightness,
        child: Scaffold(
          body: IndexedStack(
            index: Provider.of<NavigationController>(context).currentIndex,
            children: const [
              HomeView(),
              TopUpView(),
              TransactionViews(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyBottomNavigationItem(
                    index: 0,
                    activeImage: AppImages.icHomeFill.svg(
                      color: AppColors.blackDark,
                    ),
                    inactiveImage: AppImages.icHomeOutline.svg(
                      color: AppColors.grey,
                    ),
                    currentIndex: controller.currentIndex,
                    onTap: controller.changeIndex,
                    title: 'Home',
                  ),
                  MyBottomNavigationItem(
                    index: 1,
                    activeImage: AppImages.icMoneyFill.svg(
                      color: AppColors.blackDark,
                    ),
                    inactiveImage: AppImages.icMoneyOutline.svg(
                      color: AppColors.grey,
                    ),
                    currentIndex: controller.currentIndex,
                    onTap: controller.changeIndex,
                    title: 'Top Up',
                  ),
                  MyBottomNavigationItem(
                    index: 2,
                    activeImage: AppImages.icCardsFill.svg(
                      color: AppColors.blackDark,
                    ),
                    inactiveImage: AppImages.icCardsOutline.svg(
                      color: AppColors.grey,
                    ),
                    currentIndex: controller.currentIndex,
                    onTap: controller.changeIndex,
                    title: 'Transaction',
                  ),
                  MyBottomNavigationItem(
                    index: 3,
                    activeImage: AppImages.icProfileFill.svg(
                      color: AppColors.blackDark,
                    ),
                    inactiveImage: AppImages.icProfileOutline.svg(
                      color: AppColors.grey,
                    ),
                    currentIndex: controller.currentIndex,
                    onTap: controller.changeIndex,
                    title: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
