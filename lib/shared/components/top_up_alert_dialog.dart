import 'package:flutter/material.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_colors.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/utils/currency_format.dart';

void showTopUpConfirmationDialog(
  BuildContext context,
  TextEditingController nominalController, {
  required Function onConfirm,
  String title = 'Anda yakin ingin top up sebesar',
  Color confirmButtonColor = Colors.red,
}) {
  showDialog(
    context: context,
    builder: (context) {
      String nominalText =
          nominalController.text.replaceAll(RegExp(r'[^\d]'), '');
      int nominal = nominalText.isNotEmpty ? int.parse(nominalText) : 0;

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: AppImages.icLogo.image()),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              nominal == 0
                  ? 'Rp 0'
                  : '${CurrencyFormatHelper.convertIdr(nominal)} ?',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: const SizedBox(
                width: double.infinity,
                height: 30,
                child: Center(
                  child: Text(
                    'Ya, lanjutkan top up',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: const SizedBox(
                width: double.infinity,
                height: 30,
                child: Center(
                  child: Text(
                    'Batalkan',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
