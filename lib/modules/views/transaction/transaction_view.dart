import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_colors.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/utils/currency_format.dart';

import '../../../shared/components/app_bar.dart';
import '../../../shared/components/saldo_card.dart';
import '../../../shared/style/app_style.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/transaction_controller.dart';

class TransactionViews extends StatelessWidget {
  const TransactionViews({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerTransaction = Provider.of<TransactionController>(context);
    final profileController = Provider.of<ProfileController>(context);

    return Scaffold(
      appBar: MyAppBar.primaryAppbar(
        context: context,
        titleString: 'Transaction',
        isBack: false,
        centerTitle: true,
      ),
      floatingActionButton: Visibility(
        visible: controllerTransaction.showFab,
        child: FloatingActionButton(
          onPressed: controllerTransaction.scrollToTop,
          backgroundColor: AppColors.white,
          elevation: 2,
          child: const Icon(
            Icons.arrow_upward_rounded,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          controller: controllerTransaction.scrollController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction History',
                  style: AppStyle.subtitle4.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (controllerTransaction.transactionList.length > 3)
                  GestureDetector(
                    onTap: () {
                      // Kembalikan ke 3 item pertama
                      controllerTransaction.loadInitialTransactions();
                    },
                    child: Text(
                      'Show Less',
                      style: AppStyle.body1.copyWith(
                          color: AppColors.red, fontWeight: FontWeight.w600),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 18),
            controllerTransaction.transactionList.isEmpty
                ? Column(
                    children: [
                      const SizedBox(height: 130),
                      Text(
                        'No transactions found.',
                        style: AppStyle.body1,
                      ),
                    ],
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (controllerTransaction.transactionList.isEmpty) {
                        return const Center(
                          child: Text('No transactions found.'),
                        );
                      }

                      final transaction =
                          controllerTransaction.transactionList[index];
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.grey.withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  CurrencyFormatHelper.convertIdr(
                                      transaction.totalAmount ?? 0),
                                  style: AppStyle.subtitle2.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  transaction.createdOn ?? '',
                                  style: AppStyle.body2.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              transaction.description ?? '',
                              style: AppStyle.body2.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemCount: controllerTransaction.transactionList.length,
                  ),
            if (controllerTransaction.isMoreDataAvailable)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: TextButton(
                    onPressed: () =>
                        controllerTransaction.loadMoreTransactions(),
                    child: Text(
                      'Show More',
                      style: AppStyle.subtitle4.copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
