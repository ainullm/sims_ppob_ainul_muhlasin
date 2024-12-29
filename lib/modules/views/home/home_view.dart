import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/models/dummy/banner_dummy_model.dart';
import 'package:sims_ppob_ainul_muhlasin/models/dummy/content_dummy_model.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/transaction_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/views/auth/widgets/logo_title_widget.dart';
import 'package:sims_ppob_ainul_muhlasin/routes/routes.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/saldo_card.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_style.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/utils/currency_format.dart';

import '../../../shared/style/app_colors.dart';
import '../../controllers/profile_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Provider.of<ProfileController>(context);

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyLogoTitle(
                  image: AppImages.icLogo.image(
                    width: 24,
                    height: 24,
                  ),
                  textLogo: 'SIMS PPOB',
                  textStyle: AppStyle.headline4,
                ),
                GestureDetector(
                  onTap: () {
                    log('Profile');
                  },
                  child: AppImages.imPhotoProfle.image(
                    width: 40,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang,',
                  style: AppStyle.subtitle2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                profileController.profile != null
                    ? Text(
                        '${profileController.profile?.firstName ?? ''} ${profileController.profile?.lastName ?? ''}',
                        style: AppStyle.title4.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const Text(
                        'Data tidak tersedia',
                        style: TextStyle(color: Colors.grey),
                      ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MySaldoCard(
              currency: CurrencyFormatHelper.convertIdr(
                    profileController.balance?.balance ?? 0,
                  ) ??
                  '0',
              isShowCurrency: profileController.isVisibleBalance == true,
              showButtonSaldo: true,
              onTap: () {
                profileController.changeVisibilityBalance();
                log('Lihat Saldo');
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: content.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: constraints.maxWidth / 600,
                ),
                itemBuilder: (context, index) {
                  final ContentDummyModel item = content[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.payment,
                        arguments: item,
                      );
                    },
                    child: Card(
                      color: AppColors.transparant,
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          item.imageUrl,
                          const SizedBox(height: 5),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: AppStyle.body2.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Temukan Promo Menarik',
              style: AppStyle.body1.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 140,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final BannerDummyModel item = banner[index];
                return Container(
                  child: item.image,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 14);
              },
              itemCount: banner.length,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
