import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/models/dummy/top_up_dummy_model.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/fill_button_widget.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/top_up_alert_dialog.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/app_bar.dart';
import '../../../shared/components/input_form_widget.dart';
import '../../../shared/components/outline_button_widget.dart';
import '../../../shared/components/saldo_card.dart';
import '../../../shared/style/app_colors.dart';
import '../../../shared/style/app_style.dart';
import '../../../shared/utils/currency_format.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/transaction_controller.dart';

class TopUpView extends StatelessWidget {
  const TopUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TransactionController>(context);
    final profileController = Provider.of<ProfileController>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: MyAppBar.primaryAppbar(
          titleString: 'Top Up',
          context: context,
          isBack: false,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
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
                'Silahkan masukan',
                style: AppStyle.subtitle2.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'nominal top up',
                style: AppStyle.subtitle1.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              MyInputForm(
                name: 'Nominal Top Up',
                hintText: 'Masukan Nominal Top Up',
                keyboardType: TextInputType.number,
                controller: controller.nominalController,
                onChanged: (value) {},
                preffixWidget: Text(
                  'Rp',
                  style: AppStyle.subtitle4.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.grey,
                  ),
                ),
                suffixWidget: controller.nominalController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () => controller.clearNominal(),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.grey,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemCount: topUpDummyList.length,
                itemBuilder: (context, index) {
                  final TopUpDummyModel data = topUpDummyList[index];
                  return MyOutlineButton(
                    onPressed: () => controller.setNominal(data.price!),
                    expanded: false,
                    color: AppColors.grey,
                    child: Text(
                      data.textPrice!,
                      style: AppStyle.body2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              MyFillButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('Top Up');
                  controller.nominalController.text.isEmpty
                      ? null
                      : showTopUpConfirmationDialog(
                          context, controller.nominalController, onConfirm: () {
                          controller.requestTopUp(
                            {
                              'top_up_amount':
                                  controller.nominalController.text,
                            },
                          );
                          controller.clearNominal();
                        });
                },
                text: 'Top Up',
                expanded: false,
                height: 45,
                color: controller.nominalController.text.isEmpty
                    ? AppColors.grey
                    : AppColors.primaryColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
