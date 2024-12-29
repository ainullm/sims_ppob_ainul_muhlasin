import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/core/repositories/transaction_repositories.dart';
import 'package:sims_ppob_ainul_muhlasin/models/transaction_model.dart';


class TransactionController extends ChangeNotifier {
  TransactionController() {
    scrollController.addListener(onScroll);
    loadInitialTransactions();
    getAllTransaction().then((value) => notifyListeners());
  }

  final TextEditingController nominalController = TextEditingController();
  String lastFormattedValue = '';
  final ScrollController scrollController = ScrollController();
  bool showFab = false;

  List<Records> transactionList = [];

  void clearData() {
    scrollController.removeListener(onScroll);
    transactionList = [];
  }

  void onScroll() {
    log('Scroll Offset: ${scrollController.offset}');
    if (scrollController.offset >= 100.0) {
      if (!showFab) {
        log('FAB set to true');
        showFab = true;
        notifyListeners();
      }
    } else {
      if (showFab) {
        log('FAB set to false');
        showFab = false;
        notifyListeners();
      }
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      // Use animateTo with the ScrollController
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void clearNominal() {
    nominalController.clear();
    lastFormattedValue = '';
    notifyListeners();
  }

  void setNominal(String nominal) {
    nominalController.text = nominal;
    notifyListeners();
  }

  int displayedItemCount = 3; // Jumlah item yang ditampilkan

  bool get isMoreDataAvailable => displayedItemCount <= transactionList.length;

  Future<void> requestTopUp(input) async {
    try {
      final res = await TransactionRepositories().requestTopUp(input);

      if (res != null && res.statusCode == 200) {
      } else {}
    } catch (e) {
      log('Request top up failed with error: $e');
      return Future.error(e);
    }
  }

  Future<void> requestPayment(input) async {
    try {
      final res = await TransactionRepositories().requestPayment(input);

      if (res != null && res.statusCode == 200) {
        
      } else {}
    } catch (e) {
      log('Request top up failed with error: $e');
      return Future.error(e);
    }
  }

  Future<void> getAllTransaction({int offset = 0, int limit = 3}) async {
    try {
      final res = await TransactionRepositories()
          .getAllTransaction(offset: 0, limit: 3);

      if (res.isNotEmpty) {
        log('Data: $res');
        transactionList = res;
        notifyListeners();
      } else {
        transactionList = [];
        notifyListeners();
      }
    } catch (e) {
      log('Get all transaction failed with error: $e');
      return Future.error(e);
    }
  }

  bool _isLoading = false;
  int limit = 3;
  Future<void> loadInitialTransactions() async {
    _isLoading = true;
    notifyListeners();

    try {
      clearData();
      limit = 3;
      transactionList = await TransactionRepositories()
          .getAllTransaction(offset: 0, limit: 3);
    } catch (e) {
      log('Load initial transactions failed: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreTransactions() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newTransactions = await TransactionRepositories()
          .getAllTransaction(offset: 0, limit: limit);
      if (newTransactions.isNotEmpty) {
        transactionList.addAll(newTransactions);
        limit += 3;
      }
    } catch (e) {
      log('Load more transactions failed: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
