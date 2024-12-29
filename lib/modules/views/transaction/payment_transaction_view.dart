import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/profile_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/app_bar.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_style.dart';
import 'package:sizer/sizer.dart';

import '../../../models/dummy/content_dummy_model.dart';
import '../../../shared/components/fill_button_widget.dart';
import '../../../shared/components/input_form_widget.dart';
import '../../../shared/components/saldo_card.dart';
import '../../../shared/components/top_up_alert_dialog.dart';
import '../../../shared/style/app_colors.dart';
import '../../../shared/utils/currency_format.dart';
import '../../controllers/transaction_controller.dart';

class PaymentTransactionView extends StatelessWidget {
  const PaymentTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionController = Provider.of<TransactionController>(context);
    final profileController = Provider.of<ProfileController>(context);
    final ContentDummyModel? item =
        ModalRoute.of(context)?.settings.arguments as ContentDummyModel?;
    return Scaffold(
      appBar: MyAppBar.primaryAppbar(
        titleString: 'Pembayaran',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            MySaldoCard(
              currency: CurrencyFormatHelper.convertIdr(
                    profileController.balance!.balance!,
                  ) ??
                  '0',
              isShowCurrency: true,
              onTap: () {},
            ),
            const SizedBox(height: 40),
            Text(
              'Pembayaran',
              style: AppStyle.subtitle4.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                item!.imageUrl != null
                    ? item.imageUrl
                    : Container(
                        width: 100,
                        height: 100,
                        color: AppColors.grey,
                      ),
                const SizedBox(width: 10),
                item.title.isNotEmpty
                    ? Text(
                        item.title,
                        style: AppStyle.body1.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Container(
                        width: 100,
                        height: 20,
                        color: AppColors.greyLight,
                      ),
              ],
            ),
            const SizedBox(height: 20),
            MyInputForm(
              name: 'Price',
              hintText: item.price != null
                  ? CurrencyFormatHelper.convertIdr(item.price)
                  : 'Rp 0',
              enabled: false,
              hintStyle: AppStyle.body1.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
              ),
              preffixWidget: const Icon(
                Icons.money,
                color: AppColors.greyDark,
              ),
            ),
            SizedBox(height: 30.h),
            MyFillButton(
              onPressed: () {
                transactionController.nominalController.text =
                    item.price.toString();
                transactionController.nominalController.text.isEmpty
                    ? null
                    : showTopUpConfirmationDialog(
                        context,
                        transactionController.nominalController,
                        onConfirm: () {
                          transactionController.requestPayment(
                            {
                              'service_code': item.serviceCode,
                            },
                          );
                        },
                      );
              },
              expanded: false,
              height: 45,
              text: 'Bayar',
            ),
          ],
        ),
      ),
    );
  }
}
