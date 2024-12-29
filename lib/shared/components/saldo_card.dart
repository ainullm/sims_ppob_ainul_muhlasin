
import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_style.dart';

class MySaldoCard extends StatelessWidget {
  const MySaldoCard({
    super.key,
    this.onTap,
    required this.currency,
    this.isShowCurrency = true,
    this.showButtonSaldo = false,
  });

  final Function()? onTap;
  final String currency;
  final bool? isShowCurrency;
  final bool? showButtonSaldo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.red,
            AppColors.redDark,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saldo Anda',
            style: AppStyle.subtitle3.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            isShowCurrency! ? currency : 'Rp\t\t- - - - - ',
            style: AppStyle.title4.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          showButtonSaldo!
              ? Column(
                  children: [
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: onTap,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lihat Saldo',
                            style: AppStyle.body1.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
